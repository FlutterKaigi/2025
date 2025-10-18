import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import type Stripe from "stripe";
import * as v from "valibot";
import type { PaymentCompletionWorkflowParam } from "../workflows/PaymentCompletionWorkflow/PaymentCompletionWorkflowParam";

export const PaymentCompletionApi = new Hono()
	.put(
		"/:ticketCheckoutId",
		vValidator(
			"param",
			v.object({
				ticketCheckoutId: v.string(),
			}),
		),
		vValidator("json", v.unknown()),
		async (c) => {
			const { ticketCheckoutId } = c.req.valid("param");
			const paymentIntent = c.req.valid("json");

			const instance = await env.PAYMENT_COMPLETION_WORKFLOW.create({
				id: ticketCheckoutId,
				params: {
					ticketCheckoutId,
					paymentIntent: paymentIntent as Stripe.PaymentIntent,
				} satisfies PaymentCompletionWorkflowParam,
			});
			return c.json({ id: instance.id });
		},
	)
	.get(
		"/:ticketCheckoutId",
		vValidator(
			"param",
			v.object({
				ticketCheckoutId: v.pipe(v.string(), v.uuid()),
			}),
		),
		async (c) => {
			const { ticketCheckoutId } = c.req.valid("param");
			const instance =
				await env.PAYMENT_COMPLETION_WORKFLOW.get(ticketCheckoutId);
			return c.json({ id: instance.id });
		},
	);
