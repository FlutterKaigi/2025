import { vValidator } from "@hono/valibot-validator";
import { AwsV4Signer } from "aws4fetch";
import { Hono } from "hono";
import { createRoute } from "hono-openapi";
import * as v from "valibot";

const CreateSignedUrlRequestSchema = v.object({
	key: v.string(),
	size: v.number(),
	mimeType: v.string(),
	variant: v.literal("avatar"),
	expiresIn: v.number(),
});

const CreateSignedUrlResponseSchema = v.object({
	key: v.string(),
	signed_url: v.string(),
});

const DeleteObjectRequestSchema = v.object({
	key: v.string(),
});

const DeleteObjectResponseSchema = v.object({
	success: v.boolean(),
});

const createSignedUrlRoute = createRoute({
	method: "put",
	path: "/signed-url",
	description: "Create a signed URL for uploading to R2",
	request: {
		body: {
			content: {
				"application/json": {
					schema: CreateSignedUrlRequestSchema,
				},
			},
		},
	},
	responses: {
		200: {
			content: {
				"application/json": {
					schema: CreateSignedUrlResponseSchema,
				},
			},
			description: "Signed URL created successfully",
		},
	},
});

const deleteObjectRoute = createRoute({
	method: "delete",
	path: "/object",
	description: "Delete an object from R2",
	request: {
		body: {
			content: {
				"application/json": {
					schema: DeleteObjectRequestSchema,
				},
			},
		},
	},
	responses: {
		200: {
			content: {
				"application/json": {
					schema: DeleteObjectResponseSchema,
				},
			},
			description: "Object deleted successfully",
		},
	},
});

export const r2Api = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	.openapi(createSignedUrlRoute, vValidator("json", CreateSignedUrlRequestSchema), async (c) => {
		const { key, size, mimeType, variant, expiresIn } = c.req.valid("json");
		
		try {
			const r2Endpoint = c.env.R2_ENDPOINT;
			const accessKeyId = c.env.CLOUDFLARE_R2_ACCESS_KEY_ID;
			const secretAccessKey = c.env.CLOUDFLARE_R2_SECRET_ACCESS_KEY;
			const bucketName = c.env.R2_BUCKET_NAME;

			if (!r2Endpoint || !accessKeyId || !secretAccessKey || !bucketName) {
				return c.json({ error: "Missing R2 configuration" }, 500);
			}

			// AWS4 Signerを使用してPre-signed URLを生成
			const signer = new AwsV4Signer({
				url: `${r2Endpoint}/${bucketName}`,
				accessKeyId,
				secretAccessKey,
				service: "s3",
				region: "auto",
			});

			const url = new URL(`${r2Endpoint}/${bucketName}/${key}`);
			
			// Query parametersを追加
			url.searchParams.set("X-Amz-Expires", expiresIn.toString());
			url.searchParams.set("X-Amz-Content-Sha256", "UNSIGNED-PAYLOAD");
			
			// PUTリクエスト用の署名を生成
			const signedRequest = await signer.sign(url.toString(), {
				method: "PUT",
				headers: {
					"Content-Type": mimeType,
					"Content-Length": size.toString(),
				},
			});

			const signedUrl = signedRequest.url;

			return c.json({
				key,
				signed_url: signedUrl,
			});
		} catch (error) {
			console.error("Error creating signed URL:", error);
			return c.json({ error: "Failed to create signed URL" }, 500);
		}
	})
	.openapi(deleteObjectRoute, vValidator("json", DeleteObjectRequestSchema), async (c) => {
		const { key } = c.req.valid("json");
		
		try {
			// R2 Bucket bindingを使用してオブジェクトを削除
			await c.env.R2_BUCKET.delete(key);

			return c.json({
				success: true,
			});
		} catch (error) {
			console.error("Error deleting object:", error);
			return c.json({ 
				success: false,
				error: "Failed to delete object" 
			}, 500);
		}
	});