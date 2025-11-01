import { hc } from "hono/client";
import { api } from "./api/api";
import { PaymentCompletionWorkflow } from "./workflows/PaymentCompletionWorkflow/PaymentCompletionWorkflow";
import { TicketCheckoutWorkflow } from "./workflows/TicketCheckoutWorkflow/TicketCheckoutWorkflow";
import { TicketRefundWorkflow } from "./workflows/TicketRefundWorkflow/TicketRefundWorkflow";

export default {
	fetch: api.fetch,
};

export type PaymentWorkflowApiClient = ReturnType<typeof hc<typeof api>>;

export { PaymentCompletionWorkflow, TicketCheckoutWorkflow, TicketRefundWorkflow };
export const PaymentWorkflowApiClient = (
	...args: Parameters<typeof hc>
): PaymentWorkflowApiClient => hc<typeof api>(...args);
