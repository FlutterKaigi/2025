import {
  WorkflowEntrypoint,
  type WorkflowEvent,
  type WorkflowStep,
} from "cloudflare:workers";
import { databaseSchema, getDatabase } from "@2025/database";
import { eq, type InferInsertModel } from "drizzle-orm";
import type Stripe from "stripe";
import * as v from "valibot";
import { PaymentCompletionWorkflowParam } from "./PaymentCompletionWorkflowParam";

export class PaymentCompletionWorkflow extends WorkflowEntrypoint<
  Cloudflare.Env,
  PaymentCompletionWorkflowParam
> {
  async run(
    event: WorkflowEvent<PaymentCompletionWorkflowParam>,
    step: WorkflowStep
  ) {
    console.log(`Start workflow:`);
    const parameter = v.parse(PaymentCompletionWorkflowParam, event.payload);
    const paymentIntent = parameter.paymentIntent as Stripe.PaymentIntent;

    // ticket_checkoutを取得
    const ticketCheckout = await step.do("get_ticket_checkout", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);
      const result = await db.query.ticketCheckoutSessions.findFirst({
        where: eq(
          databaseSchema.ticketCheckoutSessions.id,
          parameter.ticketCheckoutId
        ),
        with: {
          ticketCheckoutOptions: true,
          ticketType: true,
          user: {
            with: {},
          },
        },
      });
      if (result === undefined) {
        throw new Error("Ticket checkout not found");
      }
      return result;
    });

    // ticket_checkoutを購入済みとしてマーク
    await step.do("mark_ticket_checkout_as_purchased", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);
      const result = await db
        .update(databaseSchema.ticketCheckoutSessions)
        .set({
          status: "completed",
        })
        .where(
          eq(
            databaseSchema.ticketCheckoutSessions.id,
            parameter.ticketCheckoutId
          )
        );
      if (result.rowCount === 0) {
        throw new Error("Ticket checkout not found");
      }
    });

    // ticket, ticket_optionsテーブルにチケット作成
    const ticketAndOptions = await step.do("create_ticket", async () => {
      const db = getDatabase(this.env.HYPERDRIVE.connectionString);
      const result = await db.transaction(async (tx) => {
        // チケット作成
        const tickets = await tx
          .insert(databaseSchema.ticketPurchases)
          .values([
            {
              userId: ticketCheckout.user.id,
              ticketTypeId: ticketCheckout.ticketType.id,
              status: "completed",
              stripePaymentIntentId: paymentIntent.id,
            },
          ])
          .returning();
        if (tickets.length !== 1) {
          throw new Error(`Ticket not created: ${tickets}`);
        }
        const ticket = tickets[0];

        // チケットオプション作成
        const ticketOptionInserts = ticketCheckout.ticketCheckoutOptions.map(
          (option) => {
            return {
              ticketOptionId: option.id,
              ticketPurchaseId: ticket.id,
            } satisfies InferInsertModel<
              typeof databaseSchema.ticketPurchaseOptions
            >;
          }
        );
        const ticketOptions: {
          id: string;
          createdAt: string;
          updatedAt: string;
          ticketPurchaseId: string;
          ticketOptionId: string;
          optionValue: string | null;
        }[] = [];
        if (ticketOptionInserts.length > 0) {
          ticketOptions.push(
            ...(await tx
              .insert(databaseSchema.ticketPurchaseOptions)
              .values(ticketOptionInserts)
              .returning())
          );
        }

        return {
          ticket,
          ticketOptions,
        };
      });
      return result;
    });
    console.log(ticketAndOptions);

    // TODO(YumNumm): Emailを送信する
    // TODO(YumNumm): FCMで通知を送信する
  }
}
