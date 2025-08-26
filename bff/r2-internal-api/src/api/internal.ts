import { Hono } from "hono";

import { r2Api } from "./internal/r2/r2";

export const internalApi = new Hono().route("/r2", r2Api);