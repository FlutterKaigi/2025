import { Hono } from "hono";
import { logger } from "hono/logger";
import { PaymentCompletionApi } from "./PaymentCompletionApi";
import { TicketCheckoutApi } from "./TicketCheckoutApi";

export const api = new Hono<{
  Bindings: Cloudflare.Env;
}>()
  .use("*", logger())
  .route("/ticket-checkout", TicketCheckoutApi)
  .route("/payment-completion", PaymentCompletionApi)
  .onError((err, c) => {
    console.error(err);
    return c.json({ message: "Internal Server Error", error: err }, 500);
  });
