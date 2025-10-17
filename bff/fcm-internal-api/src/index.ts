import { serve } from "@hono/node-server";
import { Scalar } from "@scalar/hono-api-reference";
import { Hono } from "hono";
import { hc } from "hono/client";
import { logger } from "hono/logger";
import { openAPIRouteHandler } from "hono-openapi";
import batchApi from "./api/batch/batch";
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
      500
    );
  });
app.get(
  "openapi.json",
  openAPIRouteHandler(app, {
    documentation: {
      info: {
        title: "FCM Internal API",
        version: "1.0.0",
      },
    },
  })
);
app.get("/scalar", Scalar({ url: "/openapi.json", title: "FCM Internal API" }));

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
