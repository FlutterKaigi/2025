import { env } from "cloudflare:workers";
import { PaymentWorkflowApiClient } from "@2025/payment-workflow-internal-api";
import { Hono } from "hono";
import { describeRoute } from "hono-openapi";
import Stripe from "stripe";
import * as v from "valibot";

export const webhookApi = new Hono().post(
	"/",
	describeRoute({
		summary: "Stripe Webhook",
		description: "Stripe Webhook",
	}),
	async (c) => {
		const stripe = new Stripe(env.STRIPE_API_KEY, {
			apiVersion: "2025-08-27.basil",
		});
		const signature = c.req.header("stripe-signature");
		try {
			if (!signature) {
				return c.text("stripe-signature header is required", 400);
			}
			const body = await c.req.text();
			const event = await stripe.webhooks.constructEventAsync(
				body,
				signature,
				env.STRIPE_WEBHOOK_SECRET,
			);
			console.log(JSON.stringify(event));
			switch (event.type) {
				case "payment_intent.created": {
					console.log(event.data.object);
					break;
				}
				case "checkout.session.completed": {
					const url = new URL(c.req.url);
					const baseUrl = `${url.protocol}//${url.hostname}`;
					const paymentWorkflowApiClient = PaymentWorkflowApiClient(baseUrl, {
						fetch: env.PAYMENT_WORKFLOW_INTERNAL_API.fetch.bind(
							env.PAYMENT_WORKFLOW_INTERNAL_API,
						),
					});
					const response = await paymentWorkflowApiClient["payment-completion"][
						":ticketCheckoutId"
					].$put({
						param: {
							ticketCheckoutId: v.parse(
								v.string(),
								event.data.object.metadata?.ticket_checkout_id,
							),
						},
						json: event.data.object,
					});
					const json = await response.json();
					if (response.ok) {
						return c.json({ workflow_api: json }, { status: 200 });
					} else {
						return c.json(
							{
								error: "Failed to complete payment workflow",
								response: json,
							},
							500,
						);
					}
				}
				case "payment_intent.canceled": {
					console.log(event.data.object);
					break;
				}
				case "payment_intent.payment_failed": {
					console.log(event.data.object);
					break;
				}
				default:
					break;
			}

			return c.newResponse(null, { status: 200 });
		} catch (err) {
			console.error(err);
			const errorMessage = `${
				err instanceof Error ? err.message : "Internal server error"
			}`;
			console.error(errorMessage);
			return c.text(errorMessage, 400);
		}
	},
);
