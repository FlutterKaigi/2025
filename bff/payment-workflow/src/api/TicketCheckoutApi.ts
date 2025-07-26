import { env } from "cloudflare:workers";
import { Hono } from "hono";
import { describeRoute } from "hono-openapi";
import { resolver, validator as vValidator } from "hono-openapi/valibot";
import * as v from "valibot";
import { ContainerInstanceStatus } from "../util/ContainerInstanceStatus";
import type { TicketCheckoutWorkflowParam } from "../workflows/TicketCheckoutWorkflow/TicketCheckoutWorkflowParam";

export const TicketCheckoutApi = new Hono()
	.put(
		"/:ticketCheckoutSessionId",
		describeRoute({
			description: "チケットチェックアウトワークフローを開始する",
			responses: {
				200: {
					description: "Successful",
					content: {
						"application/json": {
							schema: resolver(ContainerInstanceStatus),
						},
					},
				},
			},
		}),
		vValidator(
			"param",
			v.object({
				ticketCheckoutSessionId: v.pipe(v.string(), v.uuid()),
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
			const status = await instance.status();
			const validatedStatus = v.parse(
				ContainerInstanceStatus,
				status satisfies ContainerInstanceStatus,
			);
			return c.json(validatedStatus);
		},
	)
	.get(
		"/:ticketCheckoutSessionId",
		describeRoute({
			description: "チケットチェックアウトワークフローのステータスを取得する",
			responses: {
				200: {
					description: "Successful",
					content: {
						"application/json": {
							schema: resolver(ContainerInstanceStatus),
						},
					},
				},
			},
		}),
		vValidator(
			"param",
			v.object({
				ticketCheckoutSessionId: v.pipe(v.string(), v.uuid()),
			}),
		),
		async (c) => {
			const { ticketCheckoutSessionId } = c.req.valid("param");
			const instance = await env.TICKET_CHECKOUT_WORKFLOW.get(
				ticketCheckoutSessionId,
			);
			const status = await instance.status();
			const validatedStatus = v.parse(
				ContainerInstanceStatus,
				status satisfies ContainerInstanceStatus,
			);
			return c.json(validatedStatus);
		},
	);
