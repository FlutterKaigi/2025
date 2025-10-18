import { env } from "cloudflare:workers";
import { databaseSchema, eq, getDatabase } from "@2025/database";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import Stripe from "stripe";
import * as v from "valibot";
import { PutCheckoutSessionRequest } from "./model/PutCheckoutSessionRequest";
import type { PutCheckoutSessionResponse } from "./model/PutCheckoutSessionResponse";

export const paymentApi = new Hono()
  .put(
    "/checkout-session",
    vValidator(
      "header",
      v.object({
        "x-api-key": v.string(),
      })
    ),
    vValidator("json", PutCheckoutSessionRequest),
    async (c) => {
      c.req.valid("header");
      const request = c.req.valid("json");

      const db = getDatabase(env.HYPERDRIVE.connectionString);

      // ユーザーを取得
      const authUser = await db.query.usersInAuth.findFirst({
        where: eq(databaseSchema.usersInAuth.id, request.user_id),
      });
      if (!authUser) {
        return c.json(
          {
            error: "authUser not found",
          },
          404
        );
      }
      if (!authUser.email) {
        return c.json(
          {
            error: "authUser email not found",
          },
          400
        );
      }

      // MEMO(YumNumm): ここらへんのQuery数が多いので最適化したい

      // チケットタイプを取得
      const ticketType = await db.query.ticketTypes.findFirst({
        where: eq(databaseSchema.ticketTypes.id, request.ticket_type_id),
      });
      if (!ticketType) {
        return c.json({ error: "ticketType not found" }, 404);
      }
      if (ticketType.isActive === false) {
        return c.json({ error: "ticketType is not active" }, 400);
      }
      if (ticketType.saleStartsAt) {
        const saleStartsAt = new Date(ticketType.saleStartsAt);
        if (saleStartsAt > new Date()) {
          return c.json(
            {
              error: `ticketType sale starts at is in the future: ${saleStartsAt}`,
            },
            400
          );
        }
      }
      if (ticketType.saleEndsAt) {
        const saleEndsAt = new Date(ticketType.saleEndsAt);
        if (saleEndsAt < new Date()) {
          return c.json(
            { error: `ticketType sale ends at is in the past: ${saleEndsAt}` },
            400
          );
        }
      }

      // ticketCheckoutを作成
      const ticketCheckoutId = crypto.randomUUID();
      const stripe = new Stripe(env.STRIPE_API_KEY);
      const session = await stripe.checkout.sessions.create({
        mode: "payment",
        line_items: [
          {
            price: ticketType.stripePriceId,
            quantity: 1,
          },
        ],
        success_url: `${request.success_url}?session_id={CHECKOUT_SESSION_ID}`,
        cancel_url: request.cancel_url,
        customer_email: authUser.email,
        expires_at: Math.floor(Date.now() / 1000) + 60 * 30, //  30 minutes
        ui_mode: "hosted",
        payment_intent_data: {
          receipt_email: authUser.email,
        },
        metadata: {
          ticket_checkout_id: ticketCheckoutId,
        },
      });
      if (
        !session.id ||
        !session.url ||
        !session.expires_at ||
        !session.status
      ) {
        return c.json({ error: "session is not valid" }, 500);
      }

      const ticketCheckoutSession = await db.transaction(async (tx) => {
        const ticketCheckoutSessions = await tx
          .insert(databaseSchema.ticketCheckoutSessions)
          .values({
            id: ticketCheckoutId,
            ticketTypeId: request.ticket_type_id,
            expiresAt: new Date(Date.now() + 10 * 60 * 1000).toISOString(),
            userId: authUser.id,
            status: "pending",
            stripeCheckoutSessionId: session.id,
            stripeCheckoutUrl:
              session.url ??
              (() => {
                throw new Error("session.url is not valid");
              })(),
          })
          .returning();
        const insertedSession = ticketCheckoutSessions[0];

        for (const ticketOptionId of request.ticket_option_ids) {
          await tx.insert(databaseSchema.ticketCheckoutOptions).values({
            checkoutSessionId: insertedSession.id,
            ticketOptionId,
          });
        }

        return insertedSession;
      });

      const response = {
        id: ticketCheckoutSession.id,
        url: session.url,
        expires_at: new Date(session.expires_at * 1000).toISOString(),
        status: session.status,
        customer_email: authUser.email,
        session: session,
      } satisfies PutCheckoutSessionResponse;

      console.log(response);

      return c.json(response);
    }
  )
  .put(
    "checkout-session/:checkoutSessionId",
    vValidator(
      "param",
      v.object({
        checkoutSessionId: v.string(),
      })
    ),
    async (c) => {
      const { checkoutSessionId } = c.req.valid("param");
      const stripe = new Stripe(env.STRIPE_API_KEY);
      await stripe.checkout.sessions.expire(checkoutSessionId);
      return c.json({ message: "Checkout session expired" }, 200);
    }
  );
