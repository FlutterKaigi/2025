import { env } from "cloudflare:workers";
import { otel } from "@hono/otel";
import { vValidator } from "@hono/valibot-validator";
import { createSampler, instrument } from "@microlabs/otel-cf-workers";
import { Scalar } from "@scalar/hono-api-reference";
import { Hono } from "hono";
import { cors } from "hono/cors";
import { logger } from "hono/logger";
import { proxy } from "hono/proxy";
import { requestId } from "hono/request-id";
import { secureHeaders } from "hono/secure-headers";
import { timingSafeEqual } from "hono/utils/buffer";
import * as v from "valibot";

const app = new Hono<{
  Bindings: Cloudflare.Env;
}>()
  .onError((err, c) => {
    console.error(err);
    return c.json({ error: "Error on Proxy", err }, 500);
  })
  .use("*", secureHeaders())
  .use("*", logger())
  .use("*", cors())
  .use("*", requestId())
  .use("*", otel())
  .use("*", async (c, next) => {
    const apiKey = c.req.header("x-api-key");
    if (apiKey === undefined) {
      return c.json({ error: "Unauthorized" }, 401);
    }
    if (!timingSafeEqual(apiKey, c.env.X_API_KEY)) {
      return c.json({ error: "Unauthorized" }, 401);
    }
    await next();
  })
  .all(
    "/proxy/:service/:path{.+}",
    vValidator(
      "param",
      v.object({
        service: v.union([
          v.literal("payment-workflow-internal-api"),
          v.literal("stripe-internal-api"),
          v.literal("r2-internal-api"),
          v.literal("profile-share-internal-api"),
        ]),
      })
    ),
    async (c) => {
      const { service } = c.req.valid("param");
      const path = c.req.param("path");
      const originalUrl = new URL(c.req.url);

      const targetUrl = new URL(`/${path}`, originalUrl.origin);
      console.log("targetUrl", targetUrl.toString());
      // Query parametersを維持
      targetUrl.search = originalUrl.search;
      console.log("targetUrl", targetUrl.toString());

      let fetcher: Fetcher;
      switch (service) {
        case "payment-workflow-internal-api": {
          fetcher = env.PAYMENT_WORKFLOW_INTERNAL_API;
          break;
        }
        case "stripe-internal-api": {
          fetcher = env.STRIPE_INTERNAL_API;
          break;
        }
        case "r2-internal-api": {
          fetcher = env.R2_INTERNAL_API;
          break;
        }
        case "profile-share-internal-api": {
          fetcher = env.PROFILE_SHARE_INTERNAL_API;
          break;
        }
        default: {
          const _exhaustive: never = service;
          throw new Error(`Unknown service: ${_exhaustive}`);
        }
      }
      console.log(`Proxying to: ${targetUrl.toString()}`);

      const response = await proxy(targetUrl.toString(), {
        fetcher,
        headers: {
          ...c.req.header(),
          "X-Forwarded-Host": c.req.header("host"),
        },
      });
      console.log("response", response);
      return response;
    }
  )
  .get("/scalar", Scalar({ url: "/openapi", title: "Internal API Proxy" }));

export type StripeWebhookAppType = typeof app;

export default instrument(app, {
  exporter: {
    url: "https://otlp.flutterkaigi.jp/v1/traces",
    headers: {
      "x-flutterkaigi-service-name": "internal-api-proxy",
    },
  },
  service: {
    name: "internal-api-proxy",
    namespace: `flutterkaigi-2025-${env.ENVIRONMENT}`,
  },
  sampling: {
    headSampler: createSampler({
      ratio: 1,
    }),
  },
});
