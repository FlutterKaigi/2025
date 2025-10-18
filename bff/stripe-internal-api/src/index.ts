import { env } from "cloudflare:workers";
import { otel } from "@hono/otel";
import { createSampler, instrument } from "@microlabs/otel-cf-workers";
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
	.use("*", otel())
	.use("*", logger())
	.route("/internal", internalApi)
	.onError((err, c) => {
		console.error(err);
		return c.json({ message: "Internal Server Error", error: err }, 500);
	});

export type StripeWebhookAppType = typeof app;

export default instrument(app, {
	exporter: {
		url: "https://otlp.flutterkaigi.jp/v1/traces",
		headers: {
			"x-flutterkaigi-service-name": "stripe-internal-api",
		},
	},
	service: {
		name: "stripe-internal-api",
		namespace: `flutterkaigi-2025-${env.ENVIRONMENT}`,
	},
	sampling: {
		headSampler: createSampler({
			ratio: 1,
		}),
	},
});
