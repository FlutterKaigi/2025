import * as v from "valibot";

/**
 * FCM メッセージのスキーマ
 */
export const FcmMessageSchema = v.object({
	token: v.string(),
	notification: v.optional(
		v.object({
			title: v.string(),
			body: v.string(),
			imageUrl: v.optional(v.string()),
		}),
	),
	data: v.optional(v.record(v.string(), v.string())),
	android: v.optional(
		v.object({
			priority: v.optional(v.picklist(["normal", "high"])),
			notification: v.optional(
				v.object({
					sound: v.optional(v.string()),
					channelId: v.optional(v.string()),
				}),
			),
		}),
	),
	apns: v.optional(
		v.object({
			payload: v.optional(
				v.object({
					aps: v.optional(
						v.object({
							sound: v.optional(v.string()),
						}),
					),
				}),
			),
		}),
	),
});

/**
 * Batch 送信リクエストのスキーマ
 */
export const BatchSendRequestSchema = v.object({
	messages: v.array(FcmMessageSchema),
});

export type BatchSendRequest = v.InferOutput<typeof BatchSendRequestSchema>;
export type FcmMessage = v.InferOutput<typeof FcmMessageSchema>;
