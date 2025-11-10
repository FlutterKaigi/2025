import fs from "node:fs";
import path from "node:path";
import { serve } from "@hono/node-server";
import { httpInstrumentationMiddleware } from "@hono/otel";
import { cert, initializeApp } from "firebase-admin/app";
import { Hono } from "hono";
import { hc } from "hono/client";
import { logger } from "hono/logger";
import batchApi from "./api/batch/batch";
import { sdk } from "./instruments";

// tmpディレクトリを作成（存在しない場合）
const tmpDir = path.join(process.cwd(), "tmp");
if (!fs.existsSync(tmpDir)) {
	fs.mkdirSync(tmpDir, { recursive: true });
}

// 環境変数から Firebase 認証情報を取得
const firebaseServiceAccountJson = process.env.FIREBASE_SERVICE_ACCOUNT_JSON;
if (!firebaseServiceAccountJson) {
	throw new Error("FIREBASE_SERVICE_ACCOUNT_JSON is not set");
}

// JSON が有効かどうか確認
try {
	JSON.parse(firebaseServiceAccountJson);
} catch (error) {
	console.error("Invalid FIREBASE_SERVICE_ACCOUNT_JSON:", error);
	throw new Error("FIREBASE_SERVICE_ACCOUNT_JSON must be a valid JSON string");
}

// ファイルに書き込み（JSON.stringify は不要 - 環境変数は既に JSON 文字列）
const serviceAccountPath = path.join(tmpDir, "firebase-service-account.json");
fs.writeFileSync(serviceAccountPath, firebaseServiceAccountJson);

export const firebaseApp = initializeApp({
	credential: cert(serviceAccountPath),
});

sdk.start();

const app = new Hono()
	.use("*", logger())
	.use(httpInstrumentationMiddleware())
	// .use("*", authMiddleware)
	.route("/batch", batchApi)
	.get("/health", (c) => {
		return c.json({ status: "ok", timestamp: new Date().toISOString() });
	})
	.onError((err, c) => {
		console.error("Server error:", err);
		return c.json(
			{
				error: "Internal Server Error",
				message: err.message,
			},
			500,
		);
	});
const port = Number.parseInt(process.env.PORT || "8080", 10);

console.log(`Starting FCM Internal API server on port ${port}`);

serve({
	fetch: app.fetch,
	port,
});

console.log(`FCM Internal API server is running on http://localhost:${port}`);

export type FcmInternalApiClient = ReturnType<typeof hc<typeof app>>;
export const FcmInternalApiClient = (
	...args: Parameters<typeof hc>
): FcmInternalApiClient => hc<typeof app>(...args);
