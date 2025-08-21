import { env } from "cloudflare:workers";
import { databaseSchema, getDatabase } from "@2025/database";
import { eq } from "drizzle-orm";
import { Hono } from "hono";
import { describeRoute } from "hono-openapi";
import { resolver, validator as vValidator } from "hono-openapi/valibot";
import Stripe from "stripe";
import * as v from "valibot";
import { PutCheckoutSessionRequest } from "./model/PutCheckoutSessionRequest";
import { PutCheckoutSessionResponse } from "./model/PutCheckoutSessionResponse";

export const paymentApi = new Hono().put(
	"/checkout-session",
	describeRoute({
		summary: "Create Checkout Session",
		description: "Create Checkout Session",
		responses: {
			200: {
				description: "Successful",
				content: {
					"application/json": {
						schema: resolver(PutCheckoutSessionResponse),
					},
				},
			},
			400: {
				description: "Bad Request",
				content: {
					"application/json": {
						schema: resolver(v.object({ error: v.string() })),
					},
				},
			},
		},
	}),
	vValidator(
		"header",
		v.object({
			"x-api-key": v.string(),
		}),
	),
	vValidator("json", PutCheckoutSessionRequest),
	async (c) => {
		c.req.valid("header");
		const request = c.req.valid("json");

		const db = getDatabase(env.HYPERDRIVE.connectionString);

		// ユーザーを取得
		const authUser = await db.query.usersInAuth.findFirst({
			where: eq(databaseSchema.usersInAuth.id, request.user_id),
		});
		if (!authUser) {
			return c.json(
				{
					error: "authUser not found",
				},
				404,
			);
		}
		if (!authUser.email) {
			return c.json(
				{
					error: "authUser email not found",
				},
				400,
			);
		}

		// MEMO(YumNumm): ここらへんのQuery数が多いので最適化したい

		// チケットタイプを取得
		const ticketType = await db.query.ticketTypes.findFirst({
			where: eq(databaseSchema.ticketTypes.id, request.ticket_type_id),
		});
		if (!ticketType) {
			return c.json({ error: "ticketType not found" }, 404);
		}
		if (ticketType.isActive === false) {
			return c.json({ error: "ticketType is not active" }, 400);
		}
		if (ticketType.saleStartsAt) {
			const saleStartsAt = new Date(ticketType.saleStartsAt);
			if (saleStartsAt > new Date()) {
				return c.json(
					{
						error: `ticketType sale starts at is in the future: ${saleStartsAt}`,
					},
					400,
				);
			}
		}
		if (ticketType.saleEndsAt) {
			const saleEndsAt = new Date(ticketType.saleEndsAt);
			if (saleEndsAt < new Date()) {
				return c.json(
					{ error: `ticketType sale ends at is in the past: ${saleEndsAt}` },
					400,
				);
			}
		}

		// ticketCheckoutを作成
		const id = crypto.randomUUID();
		const stripe = new Stripe(env.STRIPE_API_KEY);
		const session = await stripe.checkout.sessions.create({
			mode: "payment",
			line_items: [
				{
					price: ticketType.stripePriceId,
					quantity: 1,
				},
			],
			success_url: `${request.success_url}?session_id={CHECKOUT_SESSION_ID}`,
			cancel_url: request.cancel_url,
			customer_email: authUser.email,
			expires_at: Math.floor(Date.now() / 1000) + 60 * 30, //  30 minutes
			ui_mode: "hosted",
			payment_intent_data: {
				receipt_email: authUser.email,
			},
			metadata: {
				ticket_checkout_id: id,
			},
		});
		if (!session.id || !session.url || !session.expires_at || !session.status) {
			return c.json({ error: "session is not valid" }, 500);
		}

		const ticketCheckoutSession = await db
			.insert(databaseSchema.ticketCheckoutSessions)
			.values({
				id,
				ticketTypeId: request.ticket_type_id,
				expiresAt: new Date(Date.now() + 10 * 60 * 1000).toISOString(),
				userId: authUser.id,
				status: "pending",
				stripeCheckoutSessionId: session.id,
				stripeCheckoutUrl: session.url ?? undefined,
			})
			.returning();

		const response = {
			id: ticketCheckoutSession[0].id,
			url: session.url,
			expires_at: new Date(session.expires_at * 1000).toISOString(),
			status: session.status,
			customer_email: authUser.email,
			session: session,
		} satisfies PutCheckoutSessionResponse;

		console.log(response);

		return c.json(response);
	},
);
