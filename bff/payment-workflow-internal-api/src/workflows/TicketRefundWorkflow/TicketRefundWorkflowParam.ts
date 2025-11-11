import * as v from "valibot";

export const TicketRefundWorkflowParam = v.object({
	ticketPurchaseId: v.pipe(v.string(), v.uuid()),
	actorId: v.string(),
	actorName: v.string(),
});

export type TicketRefundWorkflowParam = v.InferOutput<
	typeof TicketRefundWorkflowParam
>;
