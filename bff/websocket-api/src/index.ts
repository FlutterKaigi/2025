import { env, WorkerEntrypoint } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import { hc } from "hono/client";
import { logger } from "hono/logger";
import * as v from "valibot";
import { UserWebsocketPayload } from "./durable_objects/user_websocket_object/payload/user_websocket_payload";
import { UserWebsocketObject } from "./durable_objects/user_websocket_object/user_websocket_object";
import internalApp from "./routes/internal";
import { verifyTicket } from "./ticket/websocket_ticket";

const app = new Hono<{ Bindings: Cloudflare.Env }>()
	.use("*", logger())
	.notFound((c) => {
		return c.json(
			{
				code: "NOT_FOUND",
				message: "Not Found",
				detail: `You requested ${c.req.url} which doesn't exist in this API.`,
			},
			404,
		);
	})
	.get(
		"/ws",
		vValidator(
			"query",
			v.object({
				ticket: v.string(),
			}),
		),
		async (c) => {
			const upgrade = c.req.header("upgrade");
			console.log(upgrade);
			// if (upgrade !== "websocket") {
			//   return c.text("Upgrade header is required", 426);
			// }
			const { ticket: ticketString } = c.req.valid("query");
			const ticket = await verifyTicket(ticketString);
			console.log(ticket);

			const stub = env.USER_WEBSOCKET_OBJECT.getByName(ticket.sub);

			return stub.fetch(c.req.raw);
		},
	)
	.route("/internal", internalApp);

app.onError((err, c) => {
	console.error(err);
	return c.json({ error: err }, 500);
});

export default class extends WorkerEntrypoint {
	async fetch(request: Request) {
		return app.fetch(request);
	}

	async getStub(sub: string) {
		return env.USER_WEBSOCKET_OBJECT.getByName(sub);
	}
}
export { UserWebsocketObject, UserWebsocketPayload };

export type WebsocketApiClient = ReturnType<typeof hc<typeof app>>;
export const WebsocketApiClient = (
	...args: Parameters<typeof hc>
): WebsocketApiClient => hc<typeof app>(...args);
