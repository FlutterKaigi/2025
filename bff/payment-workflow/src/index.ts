import { env } from "cloudflare:workers";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as v from "valibot";
import { PaymentWorkflow } from "./workflows/PaymentWorkflow";

const app = new Hono();

app.get("/", (c) => {
  return c.text("Hello World");
});

app.post("/", async (c) => {
  const workflowId = crypto.randomUUID();
  console.log(`Creating workflow ${workflowId}`);
  const workflow = await env.PAYMENT_WORKFLOW.create({
    id: workflowId,
  });

  return c.json({
    workflowId,
    status: await workflow.status(),
  });
});

app.get(
  "/:id",
  vValidator(
    "param",
    v.object({
      id: v.string(),
    })
  ),

  async (c) => {
    const { id } = c.req.valid("param");
    const instance = await env.PAYMENT_WORKFLOW.get(id);
    const status = await instance.status();
    return c.json({
      id: instance.id,
      ...status,
    });
  }
);

export default {
  fetch: app.fetch,
};

export { PaymentWorkflow };
