import Stripe from "stripe";
import * as v from "valibot";

export const PaymentCompletionWorkflowParam = v.object({
	ticketCheckoutId: v.string(),
	paymentIntent: v.unknown(),
});

export type PaymentCompletionWorkflowParam = v.InferOutput<
	typeof PaymentCompletionWorkflowParam
> & {
	paymentIntent: Stripe.PaymentIntent;
};
