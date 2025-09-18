import { Scalar } from "@scalar/hono-api-reference";
import { Hono } from "hono";
import { logger } from "hono/logger";
import { secureHeaders } from "hono/secure-headers";
import { openAPISpecs } from "hono-openapi";
import { internalApi } from "./api/internal";

const app = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	.use("*", secureHeaders())
	.use("*", logger())
	.route("/internal", internalApi)
	.get("/scalar", Scalar({ url: "/openapi", title: "R2 Internal API" }))
	.onError((err, c) => {
		console.error(err);
		return c.json({ message: "Internal Server Error", error: err }, 500);
	});

app.get(
	"/openapi",
	openAPISpecs(app, {
		documentation: {
			info: {
				title: "R2 Internal API",
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

export type R2InternalApiAppType = typeof app;

export default app;
