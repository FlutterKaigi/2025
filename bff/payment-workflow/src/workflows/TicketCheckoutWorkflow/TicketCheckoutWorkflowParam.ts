import * as v from "valibot";

export const TicketCheckoutWorkflowParam = v.object({
	ticketCheckoutSessionId: v.pipe(v.string(), v.uuid()),
});

export type TicketCheckoutWorkflowParam = v.InferOutput<
	typeof TicketCheckoutWorkflowParam
>;
