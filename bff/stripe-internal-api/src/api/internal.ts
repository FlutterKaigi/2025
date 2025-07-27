import { Hono } from "hono";

import { paymentApi } from "./internal/payment/payment";

export const internalApi = new Hono().route("/payment", paymentApi);
