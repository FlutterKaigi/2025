import { Scalar } from "@scalar/hono-api-reference";
import { Hono } from "hono";
import { logger } from "hono/logger";
import { openAPIRouteHandler } from "hono-openapi";
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

api.get("/scalar", Scalar({ url: "/openapi", title: "Payment Workflow API" }));

api.get(
	"/openapi",
	openAPIRouteHandler(api, {
		documentation: {
			info: {
				title: "Payment Workflow API",
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
