import { api } from "./api/api";
import { PaymentCompletionWorkflow } from "./workflows/PaymentCompletionWorkflow/PaymentCompletionWorkflow";
import { TicketCheckoutWorkflow } from "./workflows/TicketCheckoutWorkflow/TicketCheckoutWorkflow";

export default {
	fetch: api.fetch,
};

export type PaymentWorkflowApiType = typeof api;

export { PaymentCompletionWorkflow, TicketCheckoutWorkflow };
