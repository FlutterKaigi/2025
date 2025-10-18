import { env } from "cloudflare:workers";
import { otel } from "@hono/otel";
import { instrument } from "@microlabs/otel-cf-workers";
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
  .use("*", otel())
  .route("/internal", internalApi)
  .onError((err, c) => {
    console.error(err);
    return c.json({ message: "Internal Server Error", error: err }, 500);
  });

export type R2InternalApiAppType = ReturnType<typeof hc<typeof app>>;
export const R2InternalApiClient = (...args: Parameters<typeof hc>) =>
  hc<typeof app>(...args);

export default instrument(app, {
  exporter: {
    url: "https://otlp.flutterkaigi.jp/v1/traces",
    headers: {
      "x-flutterkaigi-service-name": "r2-internal-api",
    },
  },
  service: {
    name: "r2-internal-api",
    namespace: `flutterkaigi-2025-${env.ENVIRONMENT}`,
  },
});
