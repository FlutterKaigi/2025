import * as v from "valibot";

export const FcmSendResultItemSchema = v.object({
	success: v.boolean(),
	messageId: v.optional(v.string()),
	error: v.optional(
		v.object({
			code: v.string(),
			message: v.string(),
			stack: v.optional(v.string()),
		}),
	),
});
export type FcmSendResultItem = v.InferOutput<typeof FcmSendResultItemSchema>;

export const BatchSendResponseSchema = v.object({
	successCount: v.pipe(v.number(), v.integer()),
	failureCount: v.pipe(v.number(), v.integer()),
	results: v.array(FcmSendResultItemSchema),
});

export type BatchSendResponse = v.InferOutput<typeof BatchSendResponseSchema>;
