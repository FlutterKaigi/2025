import * as v from "valibot";

export const PutSignedUrlResponse = v.object({
  key: v.string(),
  signed_url: v.string(),
});

export type PutSignedUrlResponse = v.InferInput<typeof PutSignedUrlResponse>;