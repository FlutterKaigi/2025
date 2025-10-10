import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import type * as admin from "firebase-admin";
import { getMessaging } from "../../util/firebase";
import { BatchSendRequestSchema } from "./schema";

export const batchApi = new Hono().post(
	"/send",
	vValidator("json", BatchSendRequestSchema),
	async (c) => {
		const request = c.req.valid("json");
		const messaging = getMessaging();

		try {
			// Valibot で検証済みのメッセージは Firebase Admin SDK の Message 型と互換性があるため、
			// そのまま使用できます
			const messages = request.messages as admin.messaging.Message[];

			// バッチ送信を実行
			const validateOnly = request.validateOnly ?? false;
			const response = await messaging.sendEach(messages, validateOnly);

			// 結果をまとめる
			const results = response.responses.map((res, index) => ({
				success: res.success,
				messageId: res.messageId,
				error: res.error
					? {
							code: res.error.code,
							message: res.error.message,
						}
					: undefined,
				token: request.messages[index].token,
				topic: request.messages[index].topic,
				condition: request.messages[index].condition,
			}));

			return c.json({
				successCount: response.successCount,
				failureCount: response.failureCount,
				results,
			});
		} catch (error) {
			console.error("Failed to send FCM messages:", error);
			return c.json(
				{
					error: "Failed to send FCM messages",
					details: error instanceof Error ? error.message : "Unknown error",
				},
				500,
			);
		}
	},
);
