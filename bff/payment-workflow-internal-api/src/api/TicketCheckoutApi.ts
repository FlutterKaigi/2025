import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import { describeRoute, resolver } from "hono-openapi";
import * as v from "valibot";
import type { TicketCheckoutWorkflowParam } from "../workflows/TicketCheckoutWorkflow/TicketCheckoutWorkflowParam";

export const TicketCheckoutApi = new Hono()
	.put(
		"/:ticketCheckoutSessionId",
		describeRoute({
			description: "チケットチェックアウトワークフローを開始する",
			tags: ["Ticket Checkout"],
			responses: {
				200: {
					description: "Successful",
					content: {
						"application/json": {
							schema: resolver(v.object({ id: v.string() })),
						},
					},
				},
			},
		}),
		vValidator(
			"param",
			v.object({
				ticketCheckoutSessionId: v.string(),
			}),
		),
		async (c) => {
			const { ticketCheckoutSessionId } = c.req.valid("param");
			const instance = await env.TICKET_CHECKOUT_WORKFLOW.create({
				id: ticketCheckoutSessionId,
				params: {
					ticketCheckoutSessionId,
				} satisfies TicketCheckoutWorkflowParam,
			});
			return c.json({ id: instance.id });
		},
	)
	.get(
		"/:ticketCheckoutSessionId",
		describeRoute({
			description: "チケットチェックアウトワークフローのステータスを取得する",
			tags: ["Ticket Checkout"],
			responses: {
				200: {
					description: "Successful",
					content: {
						"application/json": {
							schema: resolver(v.object({ id: v.string() })),
						},
					},
				},
			},
		}),
		vValidator(
			"param",
			v.object({
				ticketCheckoutSessionId: v.string(),
			}),
		),
		async (c) => {
			const { ticketCheckoutSessionId } = c.req.valid("param");
			const instance = await env.TICKET_CHECKOUT_WORKFLOW.get(
				ticketCheckoutSessionId,
			);
			return c.json({ id: instance.id });
		},
	);
