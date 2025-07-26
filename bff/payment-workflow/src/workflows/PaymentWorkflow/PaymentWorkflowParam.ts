import * as v from "valibot";

export const PaymentWorkflowParam = v.object({
  userId: v.string(),
  ticketCheckoutId: v.string(),
  paymentIntent: v.unknown(),
});

export type PaymentWorkflowParam = v.InferOutput<typeof PaymentWorkflowParam>;
