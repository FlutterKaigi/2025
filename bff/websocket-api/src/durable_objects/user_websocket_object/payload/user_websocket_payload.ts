import * as v from "valibot";

export const ProfileWithSnsSchema = v.object({
  profile: v.object({
    id: v.pipe(v.string(), v.uuid()),
    name: v.string(),
    comment: v.string(),
    id_adult: v.boolean(),
    created_at: v.string(),
    updated_at: v.string(),
    avatar_url: v.optional(v.pipe(v.string(), v.url())),
  }),
  sns_links: v.array(
    v.object({
      sns_type: v.union([
        v.literal("github"),
        v.literal("x"),
        v.literal("discord"),
        v.literal("medium"),
        v.literal("qiita"),
        v.literal("zenn"),
        v.literal("note"),
        v.literal("other"),
      ]),
      value: v.string(),
    })
  ),
});

export const ProfileShareWebsocketPayloadSchema = v.variant("type", [
  v.object({
    type: v.literal("ADD"),
    profile_with_sns: ProfileWithSnsSchema,
  }),
  v.object({
    type: v.literal("UPDATE"),
    profile_with_sns: ProfileWithSnsSchema,
  }),
  v.object({
    type: v.literal("DELETE"),
    profile_id: v.pipe(v.string(), v.uuid()),
  }),
]);

export const UserWebsocketPayload = v.variant("type", [
  v.object({
    type: v.literal("PROFILE_SHARE"),
    profile_share: ProfileShareWebsocketPayloadSchema,
  }),
]);

export type UserWebsocketPayload = v.InferOutput<typeof UserWebsocketPayload>;
