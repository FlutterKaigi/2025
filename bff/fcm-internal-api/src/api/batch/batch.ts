import { vValidator } from "@hono/valibot-validator";
import otel from "@opentelemetry/api";
import type * as admin from "firebase-admin";
import { getMessaging } from "firebase-admin/messaging";
import { Hono } from "hono";
import { BatchSendRequestSchema } from "./schema";

const tracer = otel.trace.getTracer("fcm-internal-api", "0.0.1");
const meter = otel.metrics.getMeter("fcm-internal-api", "0.0.1");

const fcmSendEachCounter = meter.createCounter("fcm.send.each.count");
const fcmSendEachSuccessCounter = meter.createCounter(
	"fcm.send.each.success.count",
);
const fcmSendEachErrorCounter = meter.createCounter(
	"fcm.send.each.error.count",
);

const app = new Hono().post(
	"/send",
	vValidator("json", BatchSendRequestSchema),
	async (c) => {
		return tracer.startActiveSpan("send-batch", async (span) => {
			const request = c.req.valid("json");
			const messaging = getMessaging();

			try {
				// Valibot で検証済みのメッセージは Firebase Admin SDK の Message 型と互換性があるため、
				// そのまま使用できます
				const messages = request.messages as admin.messaging.Message[];

				// バッチ送信を実行
				const validateOnly = request.validateOnly ?? false;
				const response = await tracer.startActiveSpan(
					"firebase.messaging.sendEach",
					async (span) => {
						const result = await messaging.sendEach(messages, validateOnly);
						span.setAttribute("successCount", result.successCount);
						span.setAttribute("failureCount", result.failureCount);
						fcmSendEachCounter.add(result.successCount + result.failureCount);
						fcmSendEachSuccessCounter.add(result.successCount);
						fcmSendEachErrorCounter.add(result.failureCount);
						span.end();
						return result;
					},
				);
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
			} finally {
				span.end();
			}
		});
	},
);

export default app;
