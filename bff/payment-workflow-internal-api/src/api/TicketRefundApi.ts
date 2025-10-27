import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as v from "valibot";
import type { TicketRefundWorkflowParam } from "../workflows/TicketRefundWorkflow/TicketRefundWorkflowParam";

export const TicketRefundApi = new Hono()
	.put(
		"/:ticketPurchaseId",
		vValidator(
			"param",
			v.object({
				ticketPurchaseId: v.string(),
			}),
		),
		async (c) => {
			const { ticketPurchaseId } = c.req.valid("param");
			const instance = await env.TICKET_REFUND_WORKFLOW.create({
				id: ticketPurchaseId,
				params: {
					ticketPurchaseId,
				} satisfies TicketRefundWorkflowParam,
			});
			return c.json({ id: instance.id });
		},
	)
	.get(
		"/:ticketPurchaseId",
		vValidator(
			"param",
			v.object({
				ticketPurchaseId: v.pipe(v.string(), v.uuid()),
			}),
		),
		async (c) => {
			const { ticketPurchaseId } = c.req.valid("param");
			const instance = await env.TICKET_REFUND_WORKFLOW.get(ticketPurchaseId);
			return c.json({ id: instance.id });
		},
	);
