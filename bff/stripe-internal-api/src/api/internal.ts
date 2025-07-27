import { env } from "cloudflare:workers";
import { Hono } from "hono";
import { timingSafeEqual } from "hono/utils/buffer";

import { paymentApi } from "./internal/payment/payment";

export const internalApi = new Hono()
  .use("*", async (c, next) => {
    const xApiKey = c.req.header("x-api-key");
    if (!xApiKey) {
      return c.json(
        {
          error: "x-api-key header is required",
        },
        400
      );
    }
    if (!timingSafeEqual(xApiKey, env.X_API_KEY)) {
      return c.json(
        {
          error: "invalid x-api-key",
        },
        401
      );
    }
    await next();
  })
  .route("/payment", paymentApi);
