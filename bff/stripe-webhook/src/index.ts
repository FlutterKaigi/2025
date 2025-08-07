import { Scalar } from "@scalar/hono-api-reference";
import { Hono } from "hono";
import { logger } from "hono/logger";
import { secureHeaders } from "hono/secure-headers";
import { openAPISpecs } from "hono-openapi";
import { webhookApi } from "./api/webhook";

const app = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	.use("*", secureHeaders())
	.use("*", logger())
	.route("/webhook", webhookApi)
	.get("/scalar", Scalar({ url: "/openapi", title: "Stripe Webhook API" }));

app.get(
	"/openapi",
	openAPISpecs(app, {
		documentation: {
			info: {
				title: "Stripe Webhook API",
				version: "1.0.0",
				contact: {
					name: "Ryotaro Onoue",
					url: "https://github.com/YumNumm",
				},
				license: {
					name: "MIT",
				},
			},

			servers: [
				{
					url: "https://localhost:8787",
					description: "Local Development",
				},
			],
		},
	}),
);

export type StripeWebhookAppType = typeof app;

export default app;
