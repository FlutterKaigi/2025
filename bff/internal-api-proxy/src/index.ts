import { vValidator } from "@hono/valibot-validator";
import { Scalar } from "@scalar/hono-api-reference";
import { Hono } from "hono";
import { cors } from "hono/cors";
import { logger } from "hono/logger";
import { proxy } from "hono/proxy";
import { secureHeaders } from "hono/secure-headers";
import { timingSafeEqual } from "hono/utils/buffer";
import { openAPISpecs } from "hono-openapi";
import * as v from "valibot";

const app = new Hono<{
  Bindings: Cloudflare.Env;
}>()
  .use("*", secureHeaders())
  .use("*", logger())
  .use("*", cors())
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
        ]),
      })
    ),
    async (c) => {
      const { service } = c.req.valid("param");
      const path = c.req.param("path");
      const originalUrl = new URL(c.req.url);

      const targetUrl = new URL(`/${path}`, originalUrl.origin);
      // Query parametersを維持
      targetUrl.search = originalUrl.search;

      let fetcher: Fetcher;
      switch (service) {
        case "payment-workflow-internal-api": {
          fetcher = c.env.PAYMENT_WORKFLOW_INTERNAL_API;
          break;
        }
        case "stripe-internal-api": {
          fetcher = c.env.STRIPE_INTERNAL_API;
          break;
        }
        default: {
          const _exhaustive: never = service;
          throw new Error(`Unknown service: ${_exhaustive}`);
        }
      }
      console.log(`Proxying to: ${targetUrl.toString()}`);

      return proxy(targetUrl.toString(), {
        fetcher,
        ...c.req, // optional, specify only when forwarding all the request data (including credentials) is necessary.
        headers: {
          ...c.req.header(),
          "X-Forwarded-Host": c.req.header("host"),
        },
      });
    }
  )
  .get("/scalar", Scalar({ url: "/openapi", title: "Internal API Proxy" }));

app.get(
  "/openapi",
  openAPISpecs(app, {
    documentation: {
      info: {
        title: "Internal API Proxy",
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
  })
);

export type StripeWebhookAppType = typeof app;

export default app;
