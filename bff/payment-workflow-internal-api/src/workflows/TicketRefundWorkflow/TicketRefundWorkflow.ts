import {
	WorkflowEntrypoint,
	type WorkflowEvent,
	type WorkflowStep,
} from "cloudflare:workers";
import { databaseSchema, eq, getDatabase } from "@2025/database";
import { WebsocketApiClient } from "@2025/websocket-api";
import Stripe from "stripe";
import * as v from "valibot";
import { TicketRefundWorkflowParam } from "./TicketRefundWorkflowParam";

export class TicketRefundWorkflow extends WorkflowEntrypoint<
	Cloudflare.Env,
	TicketRefundWorkflowParam
> {
	async run(
		event: WorkflowEvent<TicketRefundWorkflowParam>,
		step: WorkflowStep,
	) {
		const parameter = v.parse(TicketRefundWorkflowParam, event.payload);
		const startTime = new Date();

		try {
			// Slack webhook通知（返金処理開始）
			await step.do("notify_slack_start", async () => {
				const slackWebhookUrl = this.env.SLACK_REFUND_WEBHOOK_URL;
				if (!slackWebhookUrl) {
					console.warn("SLACK_REFUND_WEBHOOK_URL is not set");
					return;
				}

				const dateTime = startTime.toLocaleString("ja-JP", {
					timeZone: "Asia/Tokyo",
				});

				const json = {
					text: "🔄 チケット返金処理開始",
					attachments: [
						{
							color: "#FFA500",
							fields: [
								{
									title: "処理時刻",
									value: `\`${dateTime}\``,
									short: false,
								},
								{
									title: "チケット購入ID",
									value: parameter.ticketPurchaseId,
									short: true,
								},
								{
									title: "実行者ID",
									value: parameter.actorId,
									short: true,
								},
								{
									title: "実行者名",
									value: parameter.actorName,
									short: false,
								},
							],
						},
					],
				};

				await fetch(slackWebhookUrl, {
					method: "POST",
					body: JSON.stringify(json),
					headers: {
						"Content-Type": "application/json",
					},
				});
			});

			// DBからチケット購入情報取得
			const ticketPurchase = await step.do(
				"get_ticket_purchase",
				async () => {
					const db = getDatabase(this.env.HYPERDRIVE.connectionString);
					const result = await db.query.ticketPurchases.findFirst({
						where: eq(databaseSchema.ticketPurchases.id, parameter.ticketPurchaseId),
						with: {
							user: true,
							ticketType: true,
						},
					});
					if (result === undefined) {
						throw new Error(
							`Ticket purchase not found: ${parameter.ticketPurchaseId}`,
						);
					}
					return result;
				},
			);

			// チケットが未返金であることを確認
			await step.do("verify_not_refunded", async () => {
				if (ticketPurchase.status !== "completed") {
					throw new Error(
						`Ticket is not in completed status: ${ticketPurchase.status}`,
					);
				}
			});

			// Payment intentがあることを確認
			await step.do("verify_payment_intent", async () => {
				if (!ticketPurchase.stripePaymentIntentId) {
					throw new Error(
						`Stripe payment intent ID not found for ticket: ${parameter.ticketPurchaseId}`,
					);
				}

				const stripe = new Stripe(this.env.STRIPE_API_KEY);
				const paymentIntent = await stripe.paymentIntents.retrieve(
					ticketPurchase.stripePaymentIntentId,
				);

				if (!paymentIntent) {
					throw new Error(
						`Payment intent not found in Stripe: ${ticketPurchase.stripePaymentIntentId}`,
					);
				}
			});

			// Stripeで返金
			const refund = await step.do("refund_payment", async () => {
				const stripe = new Stripe(this.env.STRIPE_API_KEY);
				const refund = await stripe.refunds.create({
					payment_intent: ticketPurchase.stripePaymentIntentId!,
				});
				return refund;
			});

			// DB更新
			const updatedTicket = await step.do("update_database", async () => {
				const db = getDatabase(this.env.HYPERDRIVE.connectionString);
				const result = await db
					.update(databaseSchema.ticketPurchases)
					.set({
						status: "refunded",
						updatedAt: new Date().toISOString(),
					})
					.where(eq(databaseSchema.ticketPurchases.id, parameter.ticketPurchaseId))
					.returning();

				if (result.length !== 1) {
					throw new Error(
						`Failed to update ticket purchase: ${parameter.ticketPurchaseId}`,
					);
				}

				return result[0];
			});

			// WebSocketで配信
			await step.do("broadcast_websocket", async () => {
				const websocketApiClient = WebsocketApiClient("https://localhost", {
					fetch: this.env.WEBSOCKET_API.fetch.bind(this.env.WEBSOCKET_API),
				});

				const payload = {
					type: "TICKET_STATUS" as const,
					ticket_status: {
						id: updatedTicket.id,
						user_id: updatedTicket.userId,
						ticket_type_id: updatedTicket.ticketTypeId,
						status: "refunded" as const,
						stripe_payment_intent_id:
							updatedTicket.stripePaymentIntentId ?? undefined,
						nameplate_id: updatedTicket.nameplateId ?? undefined,
						created_at: updatedTicket.createdAt,
						updated_at: updatedTicket.updatedAt,
					},
				};

				const response = await websocketApiClient.internal.user[":sub"].$post({
					header: {
						"proxy-authentication": this.env.X_API_KEY,
					},
					param: {
						sub: ticketPurchase.user.id,
					},
					json: payload,
				});

				const json = await response.json();
				console.log("WebSocket broadcast response:", json);

				if (!response.ok) {
					throw new Error("Failed to broadcast websocket message", {
						cause: json,
					});
				}
			});

			// Slack webhook通知（返金処理完了）
			await step.do("notify_slack_complete", async () => {
				const slackWebhookUrl = this.env.SLACK_REFUND_WEBHOOK_URL;
				if (!slackWebhookUrl) {
					console.warn("SLACK_REFUND_WEBHOOK_URL is not set");
					return;
				}

				const endTime = new Date();
				const dateTime = endTime.toLocaleString("ja-JP", {
					timeZone: "Asia/Tokyo",
				});

				const json = {
					text: "✅ チケット返金処理完了",
					attachments: [
						{
							color: "#36a64f",
							fields: [
								{
									title: "処理完了時刻",
									value: `\`${dateTime}\``,
									short: false,
								},
								{
									title: "チケット購入ID",
									value: updatedTicket.id,
									short: true,
								},
								{
									title: "チケットタイプID",
									value: updatedTicket.ticketTypeId,
									short: true,
								},
								{
									title: "保有者メールアドレス",
									value: ticketPurchase.user.email ?? "N/A",
									short: false,
								},
								{
									title: "保有者名",
									value: ticketPurchase.user.name ?? "N/A",
									short: true,
								},
								{
									title: "実行者ID",
									value: parameter.actorId,
									short: true,
								},
								{
									title: "実行者名",
									value: parameter.actorName,
									short: false,
								},
								{
									title: "Stripe返金ID",
									value: refund.id,
									short: false,
								},
							],
						},
					],
				};

				await fetch(slackWebhookUrl, {
					method: "POST",
					body: JSON.stringify(json),
					headers: {
						"Content-Type": "application/json",
					},
				});
			});
		} catch (error) {
			// エラー時もSlackに通知
			await step.do("notify_slack_error", async () => {
				const slackWebhookUrl = this.env.SLACK_REFUND_WEBHOOK_URL;
				if (!slackWebhookUrl) {
					console.warn("SLACK_REFUND_WEBHOOK_URL is not set");
					return;
				}

				const errorTime = new Date();
				const dateTime = errorTime.toLocaleString("ja-JP", {
					timeZone: "Asia/Tokyo",
				});

				const errorMessage =
					error instanceof Error ? error.message : String(error);

				const json = {
					text: "❌ チケット返金処理エラー",
					attachments: [
						{
							color: "#ff0000",
							fields: [
								{
									title: "エラー発生時刻",
									value: `\`${dateTime}\``,
									short: false,
								},
								{
									title: "チケット購入ID",
									value: parameter.ticketPurchaseId,
									short: true,
								},
								{
									title: "実行者",
									value: parameter.actorName,
									short: true,
								},
								{
									title: "エラーメッセージ",
									value: `\`\`\`${errorMessage}\`\`\``,
									short: false,
								},
							],
						},
					],
				};

				await fetch(slackWebhookUrl, {
					method: "POST",
					body: JSON.stringify(json),
					headers: {
						"Content-Type": "application/json",
					},
				});
			});

			throw error;
		}
	}
}
