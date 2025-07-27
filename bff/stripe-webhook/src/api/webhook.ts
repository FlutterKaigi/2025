import { env } from "cloudflare:workers";
import type { PaymentWorkflowApiType } from "@2025/payment-workflow";
import { Hono } from "hono";
import { hc } from "hono/client";
import { describeRoute } from "hono-openapi";
import Stripe from "stripe";

export const webhookApi = new Hono().post(
  "/",
  describeRoute({
    summary: "Stripe Webhook",
    description: "Stripe Webhook",
  }),
  async (c) => {
    const stripe = new Stripe(env.STRIPE_API_KEY);
    const signature = c.req.header("stripe-signature");
    try {
      if (!signature) {
        return c.text("stripe-signature header is required", 400);
      }
      const body = await c.req.text();
      const event = await stripe.webhooks.constructEventAsync(
        body,
        signature,
        env.STRIPE_WEBHOOK_SECRET
      );
      console.log(JSON.stringify(event));
      switch (event.type) {
        case "payment_intent.created": {
          console.log(event.data.object);
          break;
        }
        case "payment_intent.succeeded": {
          const paymentWorkflowApiClient = hc<PaymentWorkflowApiType>("/", {
            fetch: env.PAYMENT_WORKFLOW_API.fetch.bind(
              env.PAYMENT_WORKFLOW_API
            ),
          });
          const response = await paymentWorkflowApiClient["ticket-checkout"][
            ":ticketCheckoutSessionId"
          ].$put({
            param: {
              ticketCheckoutSessionId: event.data.object.id,
            },
          });
          const json = await response.json();
          console.log(JSON.stringify(json));
          break;
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
      const errorMessage = `⚠️  Webhook signature verification failed. ${
        err instanceof Error ? err.message : "Internal server error"
      }`;
      console.error(errorMessage);
      return c.text(errorMessage, 400);
    }
  }
);
