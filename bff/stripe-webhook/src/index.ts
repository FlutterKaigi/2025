import { Hono } from "hono";
import { logger } from "hono/logger";
import { secureHeaders } from "hono/secure-headers";
import { webhookApi } from "./api/webhook";

const app = new Hono<{
  Bindings: Cloudflare.Env;
}>()
  .use("*", secureHeaders())
  .use("*", logger())
  .route("/webhook", webhookApi);

export type StripeWebhookAppType = typeof app;

export default app;
