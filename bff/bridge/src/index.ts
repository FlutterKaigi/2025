import { env as workersEnv } from "cloudflare:workers";
import { otel } from "@hono/otel";
import { instrument, withNextSpan } from "@microlabs/otel-cf-workers";
import { context, propagation, trace } from "@opentelemetry/api";
import { Hono } from "hono";
import { cors } from "hono/cors";
import { csrf } from "hono/csrf";
import { logger } from "hono/logger";
import { proxy } from "hono/proxy";
import { requestId } from "hono/request-id";
import { secureHeaders } from "hono/secure-headers";
import { timing } from "hono/timing";

const env = workersEnv as Cloudflare.Env & {
	ENVIRONMENT: "development" | "staging" | "production";
};

const app = new Hono()
	.onError((err, c) => {
		console.error(err);
		// packages/bff_client/lib/src/model/error/error_response.dart に準拠
		return c.json(
			{
				code: "PROXY_ERROR",
				message: `Internal Server Error: ${env.ENVIRONMENT}`,
				detail: err.toString(),
			},
			500,
		);
	})
	.use(
		timing({
			autoEnd: true,
		}),
	)
	.use("*", logger())
	.use(
		"*",
		requestId({
			headerName: "Cf-Ray",
		}),
	)
	.use(
		"*",
		otel({
			augmentSpan: true,
		}),
	)
	// CORS
	.use("*", async (c, next) => {
		const corsMiddlewareHandler = cors({
			origin: (origin) => {
				if (!origin) return null;

				switch (env.ENVIRONMENT) {
					case "development": {
						return "*";
					}
					case "staging": {
						return origin.endsWith("flutterkaigi.workers.dev")
							? origin
							: "http://localhost:3000";
					}
					case "production": {
						return origin === "https://2025-app.flutterkaigi.jp"
							? origin
							: "http://localhost:3000";
					}
				}
			},
		});
		return corsMiddlewareHandler(c, next);
	})
	// CSRF
	.use("*", csrf())
	// Secure Headers
	.use("*", secureHeaders())
	.all("*", async (c) => {
		const originalUrl = new URL(c.req.url);
		const host = env.BFF_API_HOST;
		const targetUrl = new URL(originalUrl.toString());
		targetUrl.protocol = "https";
		targetUrl.host = host;
		targetUrl.port = "443";
		targetUrl.search = originalUrl.search;
		console.log("targetUrl", targetUrl.toString());

		const span = trace.getActiveSpan();
		span?.setAttribute("http.method", c.req.method);
		span?.setAttribute("http.url", targetUrl.toString());
		withNextSpan({ destination: "proxy" });

		const headers = {
			...c.req.header(),
			"X-Forwarded-Host": c.req.header("host"),
		};
		propagation.inject(context.active(), headers);
		const response = await proxy(targetUrl.toString(), {
			...c.req,
			headers: headers,
		});
		return response;
	});

export default instrument(app, (env, _trigger) => {
	return {
		exporter: {
			url: "https://otlp.flutterkaigi.jp/v1/traces",
			headers: {
				"x-flutterkaigi-service-name": "bridge",
			},
		},
		service: {
			name: "bridge",
			namespace: `flutterkaigi-2025-${env.ENVIRONMENT}`,
		},
	};
});
