locals {
  cloudflare_account_id = "cdd8f59359fe226645e7b541cdc53b57"
  r2_bucket_name        = "2025-production"
}

module "container_registry" {
  source                          = "../../modules/container_registry"
  container_registry_name_suffix  = "2r4j"
  env                             = local.env
  container_registry_password     = local.container_registry_password
  SAKURACLOUD_ACCESS_TOKEN        = var.SAKURACLOUD_ACCESS_TOKEN
  SAKURACLOUD_ACCESS_TOKEN_SECRET = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
}

module "docker" {
  source                        = "../../modules/docker"
  docker_registry_address       = module.container_registry.container_registry_fqdn
  docker_registry_username      = module.container_registry.container_registry_username
  docker_registry_password      = local.container_registry_password
  enable_fcm_internal_api       = true
  firebase_service_account_json = base64decode(var.FIREBASE_SERVICE_ACCOUNT_JSON_PRODUCTION_BASE64)
}


module "apprun" {
  source                          = "../../modules/apprun"
  name_suffix                     = "-2r4j"
  env                             = local.env
  app_run_max_scale               = 5
  container_registry_fqdn         = module.container_registry.container_registry_fqdn
  container_registry_username     = module.container_registry.container_registry_username
  container_registry_password     = module.container_registry.container_registry_password
  container_image_id              = module.docker.docker_image_bff_sha256
  SAKURACLOUD_ACCESS_TOKEN        = var.SAKURACLOUD_ACCESS_TOKEN
  SAKURACLOUD_ACCESS_TOKEN_SECRET = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  internal_api_url                = "https://internal-api-proxy-production.flutterkaigi.workers.dev"
  websocket_base_url              = "wss://2025-websocket.flutterkaigi.jp"
  logo_base_url                   = "https://2025-bucket.flutterkaigi.jp"
  X_API_KEY                       = var.X_API_KEY
  # MEMO(YumNumm): Supabase側のTerraformから取得するようにする
  supabase_project_id         = "sotendzncvqiyfaxpydk"
  supabase_db_password        = var.SUPABASE_DB_PASSWORD_PRODUCTION
  supabase_service_role_key   = var.SUPABASE_SERVICE_ROLE_KEY_PRODUCTION
  cloudflare_account_id       = local.cloudflare_account_id
  r2_bucket_name              = local.r2_bucket_name
  r2_access_key_id            = var.R2_ACCESS_KEY_ID
  r2_secret_access_key        = var.R2_SECRET_ACCESS_KEY
  websocket_jwt_secret_base64 = var.WEBSOCKET_JWT_SECRET_BASE64
  enable_fcm_internal_api     = true
}

module "random_password" {
  source = "../../modules/random"
}

output "container_registry_fqdn" {
  value = module.container_registry.container_registry_fqdn
}

output "container_registry_username" {
  value = module.container_registry.container_registry_username
}

output "container_registry_password" {
  value     = local.container_registry_password
  sensitive = true
}
