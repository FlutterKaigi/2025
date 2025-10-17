import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import { logger } from "hono/logger";
import { secureHeaders } from "hono/secure-headers";
import * as v from "valibot";
import { UserWebsocketObject } from "./durable_objects/user_websocket_object/user_websocket_object";
import { generateTicket, verifyTicket } from "./ticket/websocket_ticket";

const app = new Hono<{ Bindings: Cloudflare.Env }>()
  .use("*", secureHeaders())
  .use("*", logger())
  .notFound((c) => {
    return c.json(
      {
        code: "NOT_FOUND",
        message: "Not Found",
        detail: `You requested ${c.req.url} which doesn't exist in this API.`,
      },
      404
    );
  })
  .get(
    "/ws",
    vValidator(
      "query",
      v.object({
        ticket: v.string(),
      })
    ),
    async (c) => {
      const upgrade = c.req.header("upgrade");
      console.log(upgrade);
      if (upgrade !== "websocket") {
        return c.text("Upgrade header is required", 426);
      }
      const { ticket: ticketString } = c.req.valid("query");
      const ticket = await verifyTicket(ticketString);

      const stub = env.USER_WEBSOCKET_OBJECT.getByName(ticket.sub);

      return stub.fetch(c.req.raw);
    }
  )
  .get("ticket", async (c) => {
    return c.json({ ticket: await generateTicket("1234") });
  });

app.onError((err, c) => {
  return c.json({ error: err }, 500);
});

export default app;
export { UserWebsocketObject };
