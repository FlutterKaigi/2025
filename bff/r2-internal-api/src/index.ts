import { Hono } from "hono";
import { hc } from "hono/client";
import { logger } from "hono/logger";
import { requestId } from "hono/request-id";
import { secureHeaders } from "hono/secure-headers";
import { internalApi } from "./api/internal";

const app = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	.use("*", secureHeaders())
	.use("*", logger())
	.use("*", requestId({ headerName: "Cf-Ray" }))
	.route("/internal", internalApi)
	.onError((err, c) => {
		console.error(err);
		return c.json({ message: "Internal Server Error", error: err }, 500);
	});

export type R2InternalApiAppType = ReturnType<typeof hc<typeof app>>;
export const R2InternalApiClient = (...args: Parameters<typeof hc>) =>
	hc<typeof app>(...args);

export default app;
