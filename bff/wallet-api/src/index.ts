import { Hono } from "hono";
import { logger } from "hono/logger";
import { requestId } from "hono/request-id";
import { secureHeaders } from "hono/secure-headers";
import wallet from "./routes/wallet";

const app = new Hono()
	.use("*", logger())
	.use("*", secureHeaders())
	.use("*", requestId({ headerName: "Cf-Ray" }));

app.route("/wallet", wallet);

app.onError((err, c) => {
	console.error(err);
	return c.json(
		{
			code: "INTERNAL_SERVER_ERROR",
			message: "Internal Server Error",
			detail: err.toString(),
		},
		500,
	);
});

export default app;
