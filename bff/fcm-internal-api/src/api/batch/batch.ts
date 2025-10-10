import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as admin from "firebase-admin";
import { getMessaging } from "../../util/firebase";
import { BatchSendRequestSchema } from "./schema";

export const batchApi = new Hono().post(
	"/send",
	vValidator("json", BatchSendRequestSchema),
	async (c) => {
		const request = c.req.valid("json");
		const messaging = getMessaging();

		try {
			// FCM メッセージを構築
			const messages: admin.messaging.Message[] = request.messages.map((msg) => {
				const message: admin.messaging.Message = {
					token: msg.token,
				};

				if (msg.notification) {
					message.notification = {
						title: msg.notification.title,
						body: msg.notification.body,
						imageUrl: msg.notification.imageUrl,
					};
				}

				if (msg.data) {
					message.data = msg.data;
				}

				if (msg.android) {
					message.android = {
						priority: msg.android.priority,
						notification: msg.android.notification
							? {
									sound: msg.android.notification.sound,
									channelId: msg.android.notification.channelId,
								}
							: undefined,
					};
				}

				if (msg.apns) {
					message.apns = {
						payload: msg.apns.payload
							? {
									aps: msg.apns.payload.aps
										? {
												sound: msg.apns.payload.aps.sound,
											}
										: undefined,
								}
							: undefined,
					};
				}

				return message;
			});

			// バッチ送信を実行
			const response = await messaging.sendEach(messages);

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
