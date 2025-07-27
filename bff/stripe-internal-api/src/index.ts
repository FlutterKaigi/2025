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
  .get("/scalar", Scalar({ url: "/openapi", title: "Stripe Internal API" }));

app.get(
  "/openapi",
  openAPISpecs(app, {
    documentation: {
      info: {
        title: "Stripe Internal API",
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
