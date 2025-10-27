import { Hono } from "hono";
import { logger } from "hono/logger";
import { PaymentCompletionApi } from "./PaymentCompletionApi";
import { TicketCheckoutApi } from "./TicketCheckoutApi";
import { TicketRefundApi } from "./TicketRefundApi";

export const api = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	.use("*", logger())
	.route("/ticket-checkout", TicketCheckoutApi)
	.route("/payment-completion", PaymentCompletionApi)
	.route("/ticket-refund", TicketRefundApi)
	.onError((err, c) => {
		console.error(err);
		return c.json({ message: "Internal Server Error", error: err }, 500);
	});
