import Stripe from "stripe";
import { Hono } from "hono";
import { drizzle } from "drizzle-orm/node-postgres";
import * as schema from "../drizzle/schema";

const app = new Hono<{
  Bindings: Cloudflare.Env;
}>();

app.post("/webhook", async (c) => {
  const stripe = new Stripe(c.env.STRIPE_API_KEY);
  const signature = c.req.header("stripe-signature");
  try {
    if (!signature) {
      return c.text("stripe-signature header is required", 400);
    }
    const body = await c.req.text();
    const event = await stripe.webhooks.constructEventAsync(
      body,
      signature,
      c.env.STRIPE_WEBHOOK_SECRET
    );
    switch (event.type) {
      case "payment_intent.created": {
        console.log(event.data.object);
        break;
      }
      case "payment_intent.succeeded": {
        console.log(event.data.object);
        break;
      }
      default:
        break;
    }

    const db = drizzle(c.env.HYPERDRIVE.connectionString, {
      schema,
    });

    return c.text("", 200);
  } catch (err) {
    const errorMessage = `⚠️  Webhook signature verification failed. ${
      err instanceof Error ? err.message : "Internal server error"
    }`;
    console.log(errorMessage);
    return c.text(errorMessage, 400);
  }
});

export default app;
