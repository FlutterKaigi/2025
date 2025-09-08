import { api } from "./api/api";
import { hc } from "hono/client";
import { PaymentCompletionWorkflow } from "./workflows/PaymentCompletionWorkflow/PaymentCompletionWorkflow";
import { TicketCheckoutWorkflow } from "./workflows/TicketCheckoutWorkflow/TicketCheckoutWorkflow";

export default {
  fetch: api.fetch,
};

export type PaymentWorkflowApiClient = ReturnType<typeof hc<typeof api>>;

export { PaymentCompletionWorkflow, TicketCheckoutWorkflow };
export const PaymentWorkflowApiClient = (
  ...args: Parameters<typeof hc>
): PaymentWorkflowApiClient => hc<typeof api>(...args);
