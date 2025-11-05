locals {
  cloudflare_account_id = "cdd8f59359fe226645e7b541cdc53b57"
  r2_bucket_name        = "2025-staging"
}

module "container_registry" {
  source                          = "../../modules/container_registry"
  env                             = local.env
  container_registry_password     = module.random_password.container_registry_password
  SAKURACLOUD_ACCESS_TOKEN        = var.SAKURACLOUD_ACCESS_TOKEN
  SAKURACLOUD_ACCESS_TOKEN_SECRET = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  container_registry_name_suffix  = "hxu9"
}

module "docker" {
  source                        = "../../modules/docker"
  docker_registry_address       = module.container_registry.container_registry_fqdn
  docker_registry_username      = module.container_registry.container_registry_username
  docker_registry_password      = module.container_registry.container_registry_password
  enable_fcm_internal_api       = false
  firebase_service_account_json = "{}" # MEMO(YumNumm): FCM Internal APIは使わないので空でセット
}

module "apprun" {
  source                          = "../../modules/apprun"
  env                             = local.env
  app_run_max_scale               = 5
  container_registry_fqdn         = module.container_registry.container_registry_fqdn
  container_registry_username     = module.container_registry.container_registry_username
  container_registry_password     = module.container_registry.container_registry_password
  container_image_id              = module.docker.docker_image_bff_sha256
  SAKURACLOUD_ACCESS_TOKEN        = var.SAKURACLOUD_ACCESS_TOKEN
  SAKURACLOUD_ACCESS_TOKEN_SECRET = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  internal_api_url                = "https://internal-api-proxy-staging.flutterkaigi.workers.dev"
  X_API_KEY                       = var.X_API_KEY
  logo_base_url                   = "https://pub-27ad8ed93aa141a0b45f128f849914ed.r2.dev"
  # MEMO(YumNumm): Supabase側のTerraformから取得するようにする
  supabase_project_id         = "ikrzxakkbmajammujqao"
  supabase_db_password        = var.SUPABASE_DB_PASSWORD_STAGING
  supabase_service_role_key   = var.SUPABASE_SERVICE_ROLE_KEY_STAGING
  cloudflare_account_id       = local.cloudflare_account_id
  r2_bucket_name              = local.r2_bucket_name
  r2_access_key_id            = var.R2_ACCESS_KEY_ID
  r2_secret_access_key        = var.R2_SECRET_ACCESS_KEY
  websocket_base_url          = "wss://websocket-api-staging.flutterkaigi.workers.dev"
  name_suffix                 = ""
  websocket_jwt_secret_base64 = var.WEBSOCKET_JWT_SECRET_BASE64
  enable_fcm_internal_api     = false
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
  value     = module.random_password.container_registry_password
  sensitive = true
}
