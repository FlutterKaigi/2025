import { env } from "cloudflare:workers";
import { Hono } from "hono";
import { describeRoute } from "hono-openapi";
import { resolver, validator as vValidator } from "hono-openapi/valibot";
import * as v from "valibot";
import { ContainerInstanceStatus } from "../util/ContainerInstanceStatus";
import type { PaymentCompletionWorkflowParam } from "../workflows/PaymentCompletionWorkflow/PaymentCompletionWorkflowParam";

export const PaymentCompletionApi = new Hono()
  .put(
    "/:userId/:ticketCheckoutId",

    describeRoute({
      description: "チケットチェックアウトワークフローを開始する",
      tags: ["Payment Completion"],
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
        ticketCheckoutId: v.pipe(v.string(), v.uuid()),
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
          paymentIntent,
        } satisfies PaymentCompletionWorkflowParam,
      });
      const status = await instance.status();
      const validatedStatus = v.parse(
        ContainerInstanceStatus,
        status satisfies ContainerInstanceStatus
      );
      return c.json(validatedStatus);
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
              schema: resolver(ContainerInstanceStatus),
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
      const status = await instance.status();
      const validatedStatus = v.parse(
        ContainerInstanceStatus,
        status satisfies ContainerInstanceStatus
      );
      return c.json(validatedStatus);
    }
  );
