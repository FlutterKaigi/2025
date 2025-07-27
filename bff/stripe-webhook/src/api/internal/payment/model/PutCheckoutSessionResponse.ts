import * as v from "valibot";

export const PutCheckoutSessionResponse = v.object({
  id: v.pipe(v.string(), v.uuid()),
  url: v.pipe(v.string(), v.url()),
  expiresAt: v.pipe(v.string(), v.isoDateTime()),
  status: v.picklist(["open", "complete", "expired"]),
  customerEmail: v.pipe(v.string(), v.email()),
  session: v.unknown(),
});

export type PutCheckoutSessionResponse = v.InferOutput<
  typeof PutCheckoutSessionResponse
>;
