import type { Context, Next } from "hono";

export async function authMiddleware(
	c: Context,
	next: Next,
): Promise<Response | undefined> {
	const proxyAuthorization = c.req.header("proxy-authorization");
	const apiKey = process.env.X_API_KEY;

	if (!apiKey) {
		console.error("X_API_KEY environment variable is not set");
		return c.json({ error: "Server configuration error" }, 500);
	}

	if (!proxyAuthorization) {
		return c.json({ error: "Proxy-Authorization header is required" }, 401);
	}

	if (proxyAuthorization !== apiKey) {
		return c.json({ error: "Unauthorized" }, 401);
	}

	await next();
}
