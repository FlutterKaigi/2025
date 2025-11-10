import { Hono } from "hono";
import { logger } from "hono/logger";
import { requestId } from "hono/request-id";
import { secureHeaders } from "hono/secure-headers";
import { internalApi } from "./api/internal";

const app = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	.use("*", secureHeaders())
	.use("*", requestId({ headerName: "Cf-Ray" }))
	.use("*", logger())
	.route("/internal", internalApi)
	.onError((err, c) => {
		console.error(err);
		return c.json({ message: "Internal Server Error", error: err }, 500);
	});

export type StripeWebhookAppType = typeof app;

export default app;
