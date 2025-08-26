import { AwsClient } from "aws4fetch";
import { Hono } from "hono";
import { describeRoute } from "hono-openapi";
import { resolver, validator as vValidator } from "hono-openapi/valibot";
import * as v from "valibot";
import { DeleteObjectRequest } from "./model/DeleteObjectRequest";
import { DeleteObjectResponse } from "./model/DeleteObjectResponse";
import { PutSignedUrlRequest } from "./model/PutSignedUrlRequest";
import { PutSignedUrlResponse } from "./model/PutSignedUrlResponse";

export const r2Api = new Hono<{
	Bindings: Cloudflare.Env;
}>()
	// PUT /signed-url - 署名付きURL生成エンドポイント
	.put(
		"/signed-url",
		describeRoute({
			summary: "Generate Signed URL for R2 Upload",
			description: "Generate a signed URL for uploading files to Cloudflare R2",
			responses: {
				200: {
					description: "Successful",
					content: {
						"application/json": {
							schema: resolver(PutSignedUrlResponse),
						},
					},
				},
				400: {
					description: "Bad Request",
					content: {
						"application/json": {
							schema: resolver(v.object({ error: v.string() })),
						},
					},
				},
				500: {
					description: "Internal Server Error",
					content: {
						"application/json": {
							schema: resolver(v.object({ error: v.string() })),
						},
					},
				},
			},
		}),
		vValidator(
			"header",
			v.object({
				"x-api-key": v.string(),
			}),
		),
		vValidator("json", PutSignedUrlRequest),
		async (c) => {
			try {
				const request = c.req.valid("json");
				const { key, size, mimeType, variant, expiresIn } = request;

				// AWS4Fetch クライアントの初期化
				const client = new AwsClient({
					accessKeyId: c.env.CLOUDFLARE_R2_ACCESS_KEY_ID,
					secretAccessKey: c.env.CLOUDFLARE_R2_SECRET_ACCESS_KEY,
					region: "auto",
					service: "s3",
				});

				// R2エンドポイントURLの構築
				const bucketName = c.env.CLOUDFLARE_R2_BUCKET_NAME || c.env.BUCKET_NAME;
				
				// Cloudflare R2の場合、アカウントIDを使用したエンドポイント
				// 実際のR2エンドポイントは https://<account-id>.r2.cloudflarestorage.com/<bucket>/<key> の形式
				const r2Endpoint = `https://cdd8f59359fe226645e7b541cdc53b57.r2.cloudflarestorage.com`;
				const objectUrl = `${r2Endpoint}/${bucketName}/${key}`;

				// 署名付きURLの生成
				const signedRequest = await client.sign(
					new Request(objectUrl, {
						method: "PUT",
						headers: {
							"Content-Type": mimeType,
							"Content-Length": size.toString(),
						},
					}),
					{
						aws: {
							signQuery: true,
							datetime: new Date().toISOString().replace(/[:-]|\.\d{3}/g, ""),
						},
						expiresIn: expiresIn || 3600, // デフォルト1時間
					}
				);

				const response: PutSignedUrlResponse = {
					key,
					signed_url: signedRequest.url,
				};

				return c.json(response);
			} catch (error) {
				console.error("Error generating signed URL:", error);
				return c.json({ error: "Failed to generate signed URL" }, 500);
			}
		}
	)
	// DELETE /object - オブジェクト削除エンドポイント
	.delete(
		"/object",
		describeRoute({
			summary: "Delete Object from R2",
			description: "Delete an object from Cloudflare R2 bucket",
			responses: {
				200: {
					description: "Successful",
					content: {
						"application/json": {
							schema: resolver(DeleteObjectResponse),
						},
					},
				},
				400: {
					description: "Bad Request",
					content: {
						"application/json": {
							schema: resolver(v.object({ error: v.string() })),
						},
					},
				},
				500: {
					description: "Internal Server Error",
					content: {
						"application/json": {
							schema: resolver(v.object({ error: v.string() })),
						},
					},
				},
			},
		}),
		vValidator(
			"header",
			v.object({
				"x-api-key": v.string(),
			}),
		),
		vValidator("json", DeleteObjectRequest),
		async (c) => {
			try {
				const request = c.req.valid("json");
				const { key } = request;

				// Service Bindingを使用してR2バケットからオブジェクトを削除
				await c.env.BUCKET.delete(key);

				const response: DeleteObjectResponse = {
					success: true,
					key,
				};

				return c.json(response);
			} catch (error) {
				console.error("Error deleting object:", error);
				return c.json({ error: "Failed to delete object" }, 500);
			}
		}
	);