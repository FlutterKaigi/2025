import { env } from "cloudflare:workers";
import { Hono } from "hono";
import { describeRoute } from "hono-openapi";
import { resolver, validator as vValidator } from "hono-openapi/valibot";
import type Stripe from "stripe";
import * as v from "valibot";
import type { PaymentCompletionWorkflowParam } from "../workflows/PaymentCompletionWorkflow/PaymentCompletionWorkflowParam";

export const PaymentCompletionApi = new Hono()
  .put(
    "/:ticketCheckoutId",

    describeRoute({
      description: "チケットチェックアウトワークフローを開始する",
      tags: ["Payment Completion"],
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
        ticketCheckoutId: v.string(),
      })
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
    }
  )
  .get(
    "/:ticketCheckoutId",
    describeRoute({
      description: "チケットチェックアウトワークフローのステータスを取得する",
      tags: ["Payment Completion"],
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
        ticketCheckoutId: v.pipe(v.string(), v.uuid()),
      })
    ),
    async (c) => {
      const { ticketCheckoutId } = c.req.valid("param");
      const instance = await env.PAYMENT_COMPLETION_WORKFLOW.get(
        ticketCheckoutId
      );
      return c.json({ id: instance.id });
    }
  );
