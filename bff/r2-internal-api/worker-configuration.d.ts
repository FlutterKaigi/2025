interface Cloudflare {
  env: {
    CLOUDFLARE_R2_ACCESS_KEY_ID: string;
    CLOUDFLARE_R2_SECRET_ACCESS_KEY: string;
    CLOUDFLARE_R2_BUCKET_NAME: string;
    ENVIRONMENT: string;
    BUCKET_NAME: string;
    BUCKET: R2Bucket;
  };
}

export default Cloudflare;