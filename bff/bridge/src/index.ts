import { env as workersEnv } from "cloudflare:workers";
import { Container, getRandom } from "@cloudflare/containers";
import { Hono } from "hono";
import { cors } from "hono/cors";
import { csrf } from "hono/csrf";
import { secureHeaders } from "hono/secure-headers";
import { endTime, startTime, timing } from "hono/timing";

const env = workersEnv as Cloudflare.Env & {
	ENVIRONMENT: "development" | "staging" | "production";
};

export class BffEngine extends Container<Cloudflare.Env> {
	defaultPort = 8080;
	sleepAfter = "30s";
	envVars = {
		SUPABASE_URL: env.SUPABASE_URL,
		SUPABASE_SERVICE_ROLE_KEY: env.SUPABASE_SERVICE_ROLE_KEY,
		CF_VERSION_METADATA_ID: env.CF_VERSION_METADATA.id,
		CF_VERSION_METADATA_TAG: env.CF_VERSION_METADATA.tag,
		CF_VERSION_METADATA_TIMESTAMP: env.CF_VERSION_METADATA.timestamp,
		POSTGRES_URL: env.POSTGRES_URL,
		X_API_KEY: env.X_API_KEY,
		INTERNAL_API_URL: env.INTERNAL_API_URL,
		LOGO_BASE_URL: env.LOGO_BASE_URL,
	};
}

const INSTANCE_COUNT = 1;

const app = new Hono()
	.use(
		timing({
			autoEnd: true,
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
						return origin.endsWith("flutter-kaigi.workers.dev")
							? origin
							: "http://localhost:8080";
					}
					case "production": {
						return "https://2025-app.flutterkaigi.jp";
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
		startTime(c, "request");
		startTime(c, "wait_for_instance_start");
		const containerInstance = await getRandom(env.bff_engine, INSTANCE_COUNT);

		containerInstance.startAndWaitForPorts();
		endTime(c, "wait_for_instance_start");

		startTime(c, "container_fetch");
		const response = await containerInstance.fetch(c.req.raw);
		endTime(c, "container_fetch");
		endTime(c, "request");
		return response;
	});

export default {
	fetch: app.fetch,
};
