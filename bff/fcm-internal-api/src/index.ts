import { serve } from "@hono/node-server";
import { Hono } from "hono";
import { logger } from "hono/logger";
import { batchApi } from "./api/batch/batch";
import { authMiddleware } from "./middleware/auth";
import { initializeFirebase } from "./util/firebase";

// Firebase を初期化
try {
	initializeFirebase();
	console.log("Firebase Admin SDK initialized successfully");
} catch (error) {
	console.error("Failed to initialize Firebase:", error);
	process.exit(1);
}

const app = new Hono()
	.use("*", logger())
	.use("*", authMiddleware)
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
