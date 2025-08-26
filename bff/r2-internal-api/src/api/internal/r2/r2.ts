import { env } from "cloudflare:workers";
import { PutObjectCommand, S3Client } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";
import { vValidator } from "@hono/valibot-validator";
import { Hono } from "hono";
import * as v from "valibot";

const CreateSignedUrlRequestSchema = v.object({
  key: v.string(),
  extension: v.string(),
  content_length: v.number(),
  expires_in: v.pipe(v.number(), v.integer(), v.minValue(0)),
  mime_type: v.string(),
});

const s3Client = new S3Client({
  region: "auto",
  endpoint: `https://${env.CLOUDFLARE_ACCOUNT_ID}.r2.cloudflarestorage.com`,
  credentials: {
    accessKeyId: env.CLOUDFLARE_R2_ACCESS_KEY_ID,
    secretAccessKey: env.CLOUDFLARE_R2_SECRET_ACCESS_KEY,
  },
});

export const r2Api = new Hono()
  .post(
    "/upload",
    vValidator("json", CreateSignedUrlRequestSchema),
    async (c) => {
      const { key, extension, content_length, mime_type, expires_in } =
        c.req.valid("json");
      console.log("Generating signed URL", {
        key,
        extension,
        content_length,
        mime_type,
        expires_in,
      });
      // keyの末尾に拡張子を追加
      const keys = key.split("/");
      const dispositionName = `${keys[keys.length - 1]}.${extension}`;

      try {
        const signedUrl = await getSignedUrl(
          s3Client,
          new PutObjectCommand({
            Bucket: env.R2_BUCKET_NAME,
            Key: key,
            ContentLength: content_length,
            ContentType: mime_type,
            ContentDisposition: `inline; filename="${dispositionName}"`,
          }),
          {
            expiresIn: expires_in,
          }
        );
        console.log("Signed URL:", signedUrl);

        return c.json({
          key,
          signed_url: signedUrl,
        });
      } catch (error) {
        console.error("Error creating signed URL:", error);
        return c.json({ error: "Failed to create signed URL" }, 500);
      }
    }
  )
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
