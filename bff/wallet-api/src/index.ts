import { Hono } from "hono";
import wallet from "./routes/wallet";

const app = new Hono();

app.route("/wallet", wallet);

app.onError((err, c) => {
  console.error(err);
  return c.json(
    {
      code: "INTERNAL_SERVER_ERROR",
      message: "Internal Server Error",
      detail: err.toString(),
    },
    500
  );
});

export default app;
