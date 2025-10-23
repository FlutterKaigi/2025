import { otel } from "@hono/otel";
import { createSampler, instrument } from "@microlabs/otel-cf-workers";
import { Hono } from "hono";
import { logger } from "hono/logger";
import { requestId } from "hono/request-id";
import { secureHeaders } from "hono/secure-headers";
import wallet from "./routes/wallet";

const app = new Hono()
  .use("*", logger())
  .use("*", secureHeaders())
  .use("*", requestId({ headerName: "Cf-Ray" }))
  .use("*", otel());

app.route("/wallet", wallet);

app.onError((err, c) => {
  console.error(err);
  return c.json(
    {
      code: "INTERNAL_SERVER_ERROR",
      message: "Internal Server Error",
      detail: err.toString(),
    },
    500
  );
});

export default instrument(app, {
  exporter: {
    url: "https://otlp.flutterkaigi.jp/v1/traces",
    headers: {
      "x-flutterkaigi-service-name": "wallet-api",
    },
  },
  service: {
    name: "wallet-api",
    namespace: `flutterkaigi-2025-production`,
  },
  sampling: {
    headSampler: createSampler({
      ratio: 1,
    }),
  },
});
