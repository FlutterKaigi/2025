import { env } from "cloudflare:workers";
import {
  GetObjectCommand,
  PutObjectCommand,
  S3Client,
} from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as v from "valibot";

const SignedUrlRequestSchema = v.union([
  v.object({
    type: v.literal("put"),
    key: v.string(),
    extension: v.string(),
    content_length: v.number(),
    expires_in: v.pipe(v.number(), v.integer(), v.minValue(0)),
    mime_type: v.string(),
  }),
  v.object({
    type: v.literal("get"),
    key: v.string(),
    expires_in: v.pipe(v.number(), v.integer(), v.minValue(0)),
  }),
]);

const s3Client = new S3Client({
  region: "auto",
  endpoint: `https://${env.CLOUDFLARE_ACCOUNT_ID}.r2.cloudflarestorage.com`,
  credentials: {
    accessKeyId: env.CLOUDFLARE_R2_ACCESS_KEY_ID,
    secretAccessKey: env.CLOUDFLARE_R2_SECRET_ACCESS_KEY,
  },
});

export const r2Api = new Hono()
  .post("/upload", vValidator("json", SignedUrlRequestSchema), async (c) => {
    const request = c.req.valid("json");
    console.log("Generating signed URL", request);
    try {
      let signedUrl: string;
      switch (request.type) {
        case "put":
          {
            signedUrl = await getSignedUrl(
              s3Client,
              new PutObjectCommand({
                Bucket: env.R2_BUCKET_NAME,
                Key: request.key,
                ContentLength: request.content_length,
                ContentType: request.mime_type,
              }),
              {
                expiresIn: request.expires_in,
              }
            );
          }
          break;
        case "get": {
          signedUrl = await getSignedUrl(
            s3Client,
            new GetObjectCommand({
              Bucket: env.R2_BUCKET_NAME,
              Key: request.key,
            }),
            {
              expiresIn: request.expires_in,
            }
          );
          break;
        }
        default: {
          const _exhaustive: never = request;
          throw new Error(`Invalid request type: ${_exhaustive}`);
        }
      }
      return c.json({
        key: request.key,
        signed_url: signedUrl,
      });
    } catch (error) {
      console.error("Error creating signed URL:", error);
      return c.json({ error: "Failed to create signed URL" }, 500);
    }
  })
  .delete(
    "/object",
    vValidator(
      "json",
      v.object({
        key: v.string(),
      })
    ),
    async (c) => {
      const { key } = c.req.valid("json");
      console.log("Deleting object", { key });

      try {
        // R2 Bucket bindingを使用してオブジェクトを削除
        await env.R2_BUCKET.delete(key);

        return c.json({
          success: true,
        });
      } catch (error) {
        console.error("Error deleting object:", error);
        return c.json(
          {
            success: false,
            error: "Failed to delete object",
          },
          500
        );
      }
    }
  );
