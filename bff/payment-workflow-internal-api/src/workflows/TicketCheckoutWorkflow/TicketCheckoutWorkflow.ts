import {
  WorkflowEntrypoint,
  type WorkflowEvent,
  type WorkflowStep,
} from "cloudflare:workers";
import { databaseSchema, getDatabase } from "@2025/database";
import { and, eq } from "drizzle-orm";
import Stripe from "stripe";
import * as v from "valibot";
import { TicketCheckoutWorkflowParam } from "./TicketCheckoutWorkflowParam";

export class TicketCheckoutWorkflow extends WorkflowEntrypoint<
  Cloudflare.Env,
  TicketCheckoutWorkflowParam
> {
  private readonly ticketCheckoutSessionTimeout = 1000 * 60 * 10; // 10 minutes

  async run(
    event: WorkflowEvent<TicketCheckoutWorkflowParam>,
    step: WorkflowStep
  ) {
    const parameter = v.parse(TicketCheckoutWorkflowParam, event.payload);

    const ticketCheckout = await step.do("get_ticket_checkout", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);
      const ticketCheckout = await db.query.ticketCheckoutSessions.findFirst({
        where: and(
          eq(
            databaseSchema.ticketCheckoutSessions.id,
            parameter.ticketCheckoutSessionId
          ),
          eq(databaseSchema.ticketCheckoutSessions.status, "pending")
        ),
        with: {
          ticketCheckoutOptions: true,
        },
      });
      return ticketCheckout;
    });

    if (!ticketCheckout) {
      throw new Error("Ticket checkout not found");
    }

    await step.sleep(
      "wait_for_session_timeout",
      this.ticketCheckoutSessionTimeout
    );

    // 購入が完了したかどうか確認
    const ticketCheckoutAfterTimeout = await step.do(
      "get_ticket_checkout_after_timeout",
      async () => {
        const db = getDatabase(this.env.HYPERDRIVE.connectionString);
        const ticketCheckout = await db.query.ticketCheckoutSessions.findFirst({
          where: and(
            eq(
              databaseSchema.ticketCheckoutSessions.id,
              parameter.ticketCheckoutSessionId
            ),
            eq(databaseSchema.ticketCheckoutSessions.status, "completed")
          ),
        });
        return ticketCheckout;
      }
    );

    if (ticketCheckoutAfterTimeout?.status === "completed") {
      return;
    }

    // payment intentを無効化
    await step.do("invalidate_checkout_session", async () => {
      const stripe = new Stripe(this.env.STRIPE_API_KEY);
      const checkoutSessionId = ticketCheckout.stripeCheckoutSessionId;
      if (checkoutSessionId === null) {
        throw new Error("Stripe payment intent not found");
      }
      await stripe.checkout.sessions.expire(checkoutSessionId);
    });

    // TicketCheckoutを無効化済みとしてマーク
    await step.do("mark_ticket_checkout_as_invalidated", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);
      await db
        .update(databaseSchema.ticketCheckoutSessions)
        .set({
          status: "expired",
        })
        .where(
          eq(
            databaseSchema.ticketCheckoutSessions.id,
            parameter.ticketCheckoutSessionId
          )
        );
    });
  }
}
