import { Hono } from "hono";
import wallet from "./routes/wallet";

const app = new Hono();

app.route("/wallet", wallet);

app.get("/", (c) => {
  return c.text("Hello Hono!");
});

export default app;
