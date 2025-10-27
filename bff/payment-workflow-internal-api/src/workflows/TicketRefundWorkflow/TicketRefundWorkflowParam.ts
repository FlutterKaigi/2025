import * as v from "valibot";

export const TicketRefundWorkflowParam = v.object({
	ticketPurchaseId: v.string(),
});

export type TicketRefundWorkflowParam = v.InferOutput<
	typeof TicketRefundWorkflowParam
>;
