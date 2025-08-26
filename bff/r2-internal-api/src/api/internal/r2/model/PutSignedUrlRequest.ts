import * as v from "valibot";

export const PutSignedUrlRequest = v.object({
  key: v.string(),
  size: v.number(),
  mimeType: v.string(),
  variant: v.literal("avatar"),
  expiresIn: v.optional(v.number(), 3600), // デフォルト1時間
});

export type PutSignedUrlRequest = v.InferInput<typeof PutSignedUrlRequest>;