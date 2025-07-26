import {
  WorkflowEntrypoint,
  type WorkflowEvent,
  type WorkflowStep,
} from "cloudflare:workers";
import { PaymentWorkflowParam } from "./PaymentWorkflow/PaymentWorkflowParam";
import Stripe from "stripe";

export class PaymentWorkflow extends WorkflowEntrypoint<
  Cloudflare.Env,
  PaymentWorkflowParam
> {
  async run(event: WorkflowEvent<PaymentWorkflowParam>, step: WorkflowStep) {
    console.log(`Start workflow:`);
    const parameter = event.payload;
    const paymentIntent = parameter.paymentIntent as Stripe.PaymentIntent;
  }
}
