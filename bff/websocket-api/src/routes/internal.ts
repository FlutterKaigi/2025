import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import { timingSafeEqual } from "hono/utils/buffer";
import * as v from "valibot";
import { UserWebsocketPayload } from "../durable_objects/user_websocket_object/payload/user_websocket_payload";

const ProxyAuthenticationSchema = v.object({
	"proxy-authentication": v.string(),
});

const app = new Hono().post(
	"/user/:sub",
	vValidator("header", ProxyAuthenticationSchema),
	vValidator("json", UserWebsocketPayload),
	vValidator(
		"param",
		v.object({
			sub: v.string(),
		}),
	),
	async (c) => {
		const { sub } = c.req.valid("param");
		const payload = c.req.valid("json");
		const header = c.req.valid("header");
		const proxyAuthentication = header["proxy-authentication"];
		if (!(await timingSafeEqual(proxyAuthentication, env.X_API_KEY))) {
			return c.json({ code: "UNAUTHORIZED", message: "Unauthorized" }, 401);
		}

		const stub = await env.USER_WEBSOCKET_OBJECT.getByName(sub);
		const response = await stub.broadcast(payload);
		return c.json(
			{ code: "OK", message: "Message sent", count: response.count },
			200,
		);
	},
);

export default app;
