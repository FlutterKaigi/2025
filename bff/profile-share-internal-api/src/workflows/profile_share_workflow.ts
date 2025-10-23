import { WorkflowEntrypoint } from "cloudflare:workers";
import { NonRetryableError } from "cloudflare:workflows";
import { databaseSchema, eq, getDatabase } from "@2025/database";
import { R2InternalApiClient } from "@2025/r2-internal-api";
import { UserWebsocketPayload, WebsocketApiClient } from "@2025/websocket-api";
import * as v from "valibot";
import { ProfileShareRequestSchema } from "..";

export class ProfileShareWorkflow extends WorkflowEntrypoint<Cloudflare.Env> {
	async run(
		event: Readonly<
			CloudflareWorkersModule.WorkflowEvent<ProfileShareRequestSchema>
		>,
		step: CloudflareWorkersModule.WorkflowStep,
	) {
		const parameter = v.parse(ProfileShareRequestSchema, event.payload);
		const db = getDatabase(this.env.HYPERDRIVE.connectionString);

		async function getUser(userId: string, env: Cloudflare.Env) {
			const user = await step.do("get_user", async () => {
				const response = await db.query.profiles.findFirst({
					where: eq(databaseSchema.profiles.id, userId),
					with: {
						usersInAuth: true,
					},
				});
				if (response == null) {
					throw new NonRetryableError("User not found");
				}
				return response;
			});
			let userAvatarUrl: string | null = null;
			const avatarKey = user.avatarKey;
			if (avatarKey !== null) {
				userAvatarUrl = await step.do("sign_url", async () => {
					const r2InternalApiClient = R2InternalApiClient("https://localhost", {
						fetch: env.R2_INTERNAL_API.fetch.bind(env.R2_INTERNAL_API),
					});
					const response = await r2InternalApiClient.internal.r2.upload.$post({
						json: {
							type: "get",
							key: avatarKey,
							expires_in: 60 * 60 * 24, // 1 day
						},
					});
					if (!response.ok) {
						throw Error("Failed to sign URL", { cause: response });
					}
					const json = await response.json();
					return json.signed_url;
				});
			} else {
				const defaultAvatarUrl = await step.do(
					"get_default_avatar_url",
					async () => {
						const response = await db.query.usersInAuth.findFirst({
							where: eq(databaseSchema.usersInAuth.id, userId),
							columns: {
								rawUserMetaData: true,
							},
						});
						const metadata = response?.rawUserMetaData as {
							avatar_url?: string | null;
						};
						return metadata?.avatar_url ?? null;
					},
				);
				userAvatarUrl = defaultAvatarUrl;
			}
			const userSnsLinks = await step.do("get_user_sns_links", async () => {
				return await db.query.userSnsLinks.findMany({
					where: eq(databaseSchema.userSnsLinks.userId, userId),
				});
			});

			return {
				user,
				userAvatarUrl,
				userSnsLinks,
			};
		}
		const firstUser = await getUser(parameter.profile_id, this.env);
		const anotherUser = await getUser(parameter.another_profile_id, this.env);

		await step.do("create_profile_share", async () => {
			const db = getDatabase(this.env.HYPERDRIVE.connectionString);
			await db
				.insert(databaseSchema.profileShare)
				.values([
					{
						fromId: firstUser.user.id,
						toId: anotherUser.user.id,
					},
					{
						fromId: anotherUser.user.id,
						toId: firstUser.user.id,
					},
				])
				.onConflictDoNothing();
		});

		await step.do("send_websocket_message", async () => {
			const websocketApiClient = WebsocketApiClient("https://localhost", {
				fetch: this.env.WEBSOCKET_API.fetch.bind(this.env.WEBSOCKET_API),
			});
			const body = v.parse(UserWebsocketPayload, {
				type: "PROFILE_SHARE",
				profile_share: {
					type: "ADD",
					profile_with_sns: {
						profile: {
							id: anotherUser.user.id,
							name: anotherUser.user.name,
							comment: anotherUser.user.comment,
							id_adult: anotherUser.user.isAdult,
							created_at: anotherUser.user.createdAt,
							updated_at: anotherUser.user.updatedAt,
							avatar_url: anotherUser.userAvatarUrl ?? undefined,
						},
						sns_links: anotherUser.userSnsLinks.map((snsLink) => ({
							sns_type: snsLink.snsType,
							value: snsLink.value,
						})),
					},
				},
			} satisfies UserWebsocketPayload);
			const response = await websocketApiClient.internal.user[":sub"].$post({
				header: {
					"proxy-authentication": this.env.X_API_KEY,
				},
				param: {
					sub: firstUser.user.id,
				},
				json: body,
			});

			const json = await response.json();
			console.log(json);

			if (!response.ok) {
				throw Error("Failed to send websocket message", {
					cause: json,
				});
			}
		});

		await step.do("send_another_websocket_message", async () => {
			const websocketApiClient = WebsocketApiClient("https://localhost", {
				fetch: this.env.WEBSOCKET_API.fetch.bind(this.env.WEBSOCKET_API),
			});
			const body = v.parse(UserWebsocketPayload, {
				type: "PROFILE_SHARE",
				profile_share: {
					type: "ADD",
					profile_with_sns: {
						profile: {
							id: firstUser.user.id,
							name: firstUser.user.name,
							comment: firstUser.user.comment,
							id_adult: firstUser.user.isAdult,
							created_at: firstUser.user.createdAt,
							updated_at: firstUser.user.updatedAt,
							avatar_url: firstUser.userAvatarUrl ?? undefined,
						},
						sns_links: firstUser.userSnsLinks.map((snsLink) => ({
							sns_type: snsLink.snsType,
							value: snsLink.value,
						})),
					},
				},
			} satisfies UserWebsocketPayload);
			const response = await websocketApiClient.internal.user[":sub"].$post({
				header: {
					"proxy-authentication": this.env.X_API_KEY,
				},
				param: {
					sub: anotherUser.user.id,
				},
				json: body,
			});

			const json = await response.json();
			console.log(json);

			if (!response.ok) {
				throw Error("Failed to send websocket message", {
					cause: json,
				});
			}
		});

		return {
			message: "Profile share workflow completed",
			firstUser,
			anotherUser,
		};
	}
}
