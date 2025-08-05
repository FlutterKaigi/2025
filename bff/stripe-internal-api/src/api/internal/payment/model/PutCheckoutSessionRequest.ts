import * as v from "valibot";

export const PutCheckoutSessionRequest = v.object({
  success_url: v.pipe(v.string(), v.url()),
  cancel_url: v.pipe(v.string(), v.url()),
  user_id: v.pipe(v.string(), v.uuid()),
  ticket_type_id: v.string(),
  ticket_option_ids: v.array(v.pipe(v.string(), v.uuid())),
});

export type PutCheckoutSessionRequest = v.InferOutput<
  typeof PutCheckoutSessionRequest
>;
