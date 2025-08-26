interface CloudflareBindings {
  ENVIRONMENT: string;
  R2_BUCKET_NAME: string;
  R2_ENDPOINT: string;
  R2_BUCKET: R2Bucket;
  CLOUDFLARE_R2_ACCESS_KEY_ID: string;
  CLOUDFLARE_R2_SECRET_ACCESS_KEY: string;
}

declare namespace Cloudflare {
  interface Env extends CloudflareBindings {}
}