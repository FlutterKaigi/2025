import { env } from "cloudflare:workers";
import { TicketSalesReporterWorkflow } from "./workflows/TicketSalesReporterWorkflow/TicketSalesReporterWorkflow";
import { Hono } from "hono";
import { vValidator } from "@hono/valibot-validator";
import * as v from "valibot";
import { sha256 } from "hono/utils/crypto";

export async function scheduled(
  _: ScheduledEvent,
  env: Cloudflare.Env,
  __: ExecutionContext
): Promise<void> {
  await env.TICKET_SALES_REPORTER.create();
}

const SlackCommandRequestSchema = v.object({
  command: v.string(),
  response_url: v.pipe(v.string(), v.url()),
  user_id: v.string(),
  user_name: v.string(),
  api_app_id: v.string(),
});

const app = new Hono();
app.post(
  "/",
  vValidator(
    "header",
    v.object({
      "x-slack-request-timestamp": v.string(),
      "x-slack-signature": v.string(),
    })
  ),
  async (c) => {
    const headers = c.req.valid("header");
    const body = await c.req.formData();
    const bodyObject = Object.fromEntries(body.entries()) as Record<
      string,
      string
    >;
    const params = v.parse(SlackCommandRequestSchema, bodyObject);

    // check signature
    const xSlackTimestamp = headers["x-slack-request-timestamp"];
    const slackTimestamp = Number(xSlackTimestamp);
    if (isNaN(slackTimestamp)) {
      throw new Error("Invalid timestamp: NaN");
    }
    if (Math.abs(slackTimestamp - Date.now() / 1000) > 60 * 5) {
      throw new Error("Invalid timestamp: out of range");
    }
    const xSlackSignature = headers["x-slack-signature"];
    if (!xSlackSignature) {
      throw new Error("Invalid signature: undefined");
    }
    // FormData raw str
    const bodyString = new URLSearchParams(bodyObject).toString();
    const signatureBaseString = `v0:${xSlackTimestamp}:${bodyString}`;
    // hmac sha256
    const key = await crypto.subtle.importKey(
      "raw",
      new TextEncoder().encode(env.SLACK_SIGNING_SECRET),
      { name: "HMAC", hash: { name: "SHA-256" } },
      false,
      ["sign", "verify"]
    );
    const generatedSignature = await crypto.subtle.sign(
      "HMAC",
      key,
      new TextEncoder().encode(signatureBaseString)
    );
    const generatedSignatureHexDigest =
      "v0=" + Buffer.from(generatedSignature).toString("hex");
    if (generatedSignatureHexDigest !== xSlackSignature) {
      throw new Error("Invalid signature: mismatch");
    }

    if (params.command === "/ticket-sales-report") {
      await env.TICKET_SALES_REPORTER.create({
        params: {
          webhookUrl: params.response_url,
        },
      });
      return c.text("しばらくお待ち下さい... 🤖", 200);
    } else {
      throw new Error("Invalid command " + params.command);
    }
  }
);

app.onError((err, c) => {
  console.error(err);
  return c.json(
    {
      response_type: "ephemeral",
      text: "😭 Error: " + err.message,
    },
    200
  );
});

export default {
  scheduled: scheduled,
  fetch: app.fetch,
};

export { TicketSalesReporterWorkflow };
