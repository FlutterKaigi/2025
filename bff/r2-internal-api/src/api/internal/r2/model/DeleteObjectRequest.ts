import * as v from "valibot";

export const DeleteObjectRequest = v.object({
  key: v.string(),
});

export type DeleteObjectRequest = v.InferInput<typeof DeleteObjectRequest>;