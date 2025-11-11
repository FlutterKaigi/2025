import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as v from "valibot";
import { ProfileShareWorkflow } from "./workflows/profile_share_workflow";

const app = new Hono();

export const ProfileShareRequestSchema = v.object({
  profile_id: v.pipe(v.string(), v.uuid()),
  another_profile_id: v.pipe(v.string(), v.uuid()),
});
export type ProfileShareRequestSchema = v.InferOutput<
  typeof ProfileShareRequestSchema
>;

app.put("/shares", vValidator("json", ProfileShareRequestSchema), async (c) => {
  const body = c.req.valid("json");
  await env.PROFILE_SHARE_WORKFLOW.create({
    params: body,
  });
  return c.json({ message: "Profile share workflow started." });
});

export default {
  fetch: app.fetch,
  queue: () => {},
};

export { ProfileShareWorkflow };
