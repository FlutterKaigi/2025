import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as v from "valibot";
import type { TicketRefundWorkflowParam } from "../workflows/TicketRefundWorkflow/TicketRefundWorkflowParam";

export const TicketRefundApi = new Hono()
  .post(
    "/",
    vValidator(
      "json",
      v.object({
        ticket_purchase_id: v.pipe(v.string(), v.uuid()),
        actor_id: v.string(),
        actor_name: v.string(),
      })
    ),
    async (c) => {
      const body = c.req.valid("json");
      try {
        const instance = await env.TICKET_REFUND_WORKFLOW.create({
          id: body.ticket_purchase_id,
          params: {
            ticketPurchaseId: body.ticket_purchase_id,
            actorId: body.actor_id,
            actorName: body.actor_name,
          } satisfies TicketRefundWorkflowParam,
        });

        return c.json({ id: instance.id });
      } catch (error: unknown) {
        if (error instanceof Error) {
          return c.json({ error: error.message }, 400);
        }
        return c.json({ error: `Internal Server Error: ${error}` }, 500);
      }
    }
  )
  .get(
    "/:workflowId",
    vValidator(
      "param",
      v.object({
        workflowId: v.pipe(v.string(), v.uuid()),
      })
    ),
    async (c) => {
      const { workflowId } = c.req.valid("param");
      const instance = await env.TICKET_REFUND_WORKFLOW.get(workflowId);
      return c.json({ id: instance.id });
    }
  );
