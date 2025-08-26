import * as v from "valibot";

export const DeleteObjectResponse = v.object({
  success: v.boolean(),
  key: v.string(),
});

export type DeleteObjectResponse = v.InferInput<typeof DeleteObjectResponse>;