import { env as workersEnv } from "cloudflare:workers";
import { Hono } from "hono";
import { cors } from "hono/cors";
import { csrf } from "hono/csrf";
import { proxy } from "hono/proxy";
import { secureHeaders } from "hono/secure-headers";
import { timing } from "hono/timing";

const env = workersEnv as Cloudflare.Env & {
  ENVIRONMENT: "development" | "staging" | "production";
};

const app = new Hono()
  .onError((err, c) => {
    console.error(err);
    return c.json({ message: "Internal Server Error", error: err }, 500);
  })
  .use(
    timing({
      autoEnd: true,
    })
  )
  // CORS
  .use("*", async (c, next) => {
    const corsMiddlewareHandler = cors({
      origin: (origin) => {
        if (!origin) return null;

        switch (env.ENVIRONMENT) {
          case "development": {
            return "*";
          }
          case "staging": {
            return origin.endsWith("flutter-kaigi.workers.dev")
              ? origin
              : "http://localhost:8080";
          }
          case "production": {
            return "https://2025-app.flutterkaigi.jp";
          }
        }
      },
    });
    return corsMiddlewareHandler(c, next);
  })
  // CSRF
  .use("*", csrf())
  // Secure Headers
  .use("*", secureHeaders())
  .all("*", async (c) => {
    const originalUrl = new URL(c.req.url);
    const host = env.BFF_API_HOST;
    const targetUrl = new URL(originalUrl.toString());
    targetUrl.host = host;
    targetUrl.search = originalUrl.search;
    console.log("targetUrl", targetUrl.toString());

    const response = await proxy(targetUrl.toString(), {
      ...c.req,
      headers: {
        ...c.req.header(),
        "X-Forwarded-Host": c.req.header("host"),
      },
    });
    return response;
  });
// .all("*", async (c) => {
// 	startTime(c, "request");
// 	startTime(c, "wait_for_instance_start");
// 	const containerInstance = await getRandom(env.bff_engine, INSTANCE_COUNT);
// 	endTime(c, "wait_for_instance_start");

// 	startTime(c, "container_fetch");
// 	const response = await containerInstance.fetch(c.req.raw);
// 	endTime(c, "container_fetch");
// 	endTime(c, "request");
// 	return response;
// });

export default {
  fetch: app.fetch,
};
