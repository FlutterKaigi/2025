import Stripe from "stripe";
import { Hono } from "hono";
import { drizzle } from "drizzle-orm/node-postgres";
import { eq, and } from "drizzle-orm";
import * as schema from "../drizzle/schema";

const app = new Hono<{
  Bindings: Cloudflare.Env;
}>();

// Middleware for API key authentication
app.use("/api/v1/*", async (c, next) => {
  const apiKey = c.req.header("x-api-key");
  if (!apiKey || apiKey !== c.env.BFF_ENGINE_API_KEY) {
    return c.json({ error: "Unauthorized" }, 401);
  }
  await next();
});

// PUT endpoint for creating Payment Intent (idempotent by user and ticket checkout ID)
app.put("/api/v1/payment-intents/:userId/:ticketCheckoutId", async (c) => {
  try {
    const userId = c.req.param("userId");
    const ticketCheckoutId = c.req.param("ticketCheckoutId");
    
    if (!userId || !ticketCheckoutId) {
      return c.json({ error: "userId and ticketCheckoutId are required" }, 400);
    }

    // Parse request body
    const body = await c.req.json();
    const { price, currency, metadata } = body;

    if (!price || !currency) {
      return c.json({ error: "price and currency are required" }, 400);
    }

    // Validate price is a positive integer
    if (typeof price !== "number" || price <= 0 || !Number.isInteger(price)) {
      return c.json({ error: "price must be a positive integer (in cents)" }, 400);
    }

    // Initialize Stripe and DB
    const stripe = new Stripe(c.env.STRIPE_API_KEY);
    const db = drizzle(c.env.HYPERDRIVE.connectionString, {
      schema,
    });

    // Check if checkout session exists
    const existingCheckout = await db
      .select()
      .from(schema.ticketCheckoutSessions)
      .where(eq(schema.ticketCheckoutSessions.id, ticketCheckoutId))
      .limit(1);

    if (existingCheckout.length === 0) {
      return c.json({ error: "Ticket checkout session not found" }, 404);
    }

    const checkout = existingCheckout[0];

    // If Payment Intent already exists for this checkout, return existing URL
    if (checkout.stripePaymentIntentId) {
      const paymentIntent = await stripe.paymentIntents.retrieve(checkout.stripePaymentIntentId);
      const url = `https://checkout.stripe.com/pay/${paymentIntent.client_secret}`;
      return c.json({ url });
    }

    // Create new Payment Intent
    const paymentIntent = await stripe.paymentIntents.create({
      amount: price,
      currency: currency.toLowerCase(),
      metadata: {
        userId,
        ticketCheckoutId,
        ...metadata
      },
      automatic_payment_methods: {
        enabled: true,
      },
    });

    // Update checkout session with Payment Intent ID
    await db
      .update(schema.ticketCheckoutSessions)
      .set({
        stripePaymentIntentId: paymentIntent.id,
        updatedAt: new Date().toISOString(),
      })
      .where(eq(schema.ticketCheckoutSessions.id, ticketCheckoutId));

    // Generate checkout URL
    const url = `https://checkout.stripe.com/pay/${paymentIntent.client_secret}`;

    return c.json({ url });
  } catch (error) {
    console.error("Error creating Payment Intent:", error);
    return c.json({ error: "Internal server error" }, 500);
  }
});

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
