import * as v from "valibot";

export const TicketSalesReporterWorkflowParams = v.object({
	webhookUrl: v.pipe(v.string(), v.url()),
});
export type TicketSalesReporterWorkflowParams = v.InferOutput<
	typeof TicketSalesReporterWorkflowParams
>;
