module "container_registry" {
  source                          = "../../modules/container_registry"
  env                             = local.env
  container_registry_password     = local.container_registry_password
  SAKURACLOUD_ACCESS_TOKEN        = var.SAKURACLOUD_ACCESS_TOKEN
  SAKURACLOUD_ACCESS_TOKEN_SECRET = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
}

module "docker" {
  source                   = "../../modules/docker"
  docker_registry_address  = module.container_registry.container_registry_fqdn
  docker_registry_username = module.container_registry.container_registry_username
  docker_registry_password = local.container_registry_password
}


module "apprun" {
  source                          = "../../modules/apprun"
  env                             = local.env
  app_run_max_scale               = 5
  container_registry_fqdn         = module.container_registry.container_registry_fqdn
  container_registry_username     = module.container_registry.container_registry_username
  container_registry_password     = local.container_registry_password
  container_image_id              = module.docker.docker_image_bff_sha256
  SAKURACLOUD_ACCESS_TOKEN        = var.SAKURACLOUD_ACCESS_TOKEN
  SAKURACLOUD_ACCESS_TOKEN_SECRET = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
  internal_api_url                = "https://internal-api-proxy-production.flutterkaigi.workers.dev"
  X_API_KEY                       = var.X_API_KEY
  logo_base_url                   = "https://2025-bucket.flutterkaigi.jp"
  # MEMO(YumNumm): Supabase側のTerraformから取得するようにする
  supabase_project_id           = "sotendzncvqiyfaxpydk"
  supabase_db_password          = var.SUPABASE_DB_PASSWORD_PRODUCTION
  supabase_service_role_key     = var.SUPABASE_SERVICE_ROLE_KEY_PRODUCTION
  firebase_service_account_json = base64decode(var.FIREBASE_SERVICE_ACCOUNT_JSON_PRODUCTION_BASE64)
  apns_key_id                   = var.APNS_KEY_ID_PRODUCTION
  apns_team_id                  = var.APNS_TEAM_ID
  apns_private_key              = base64decode(var.APNS_PRIVATE_KEY_PRODUCTION_BASE64)
  apns_environment              = "production"
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

output "fcm_internal_api_public_url" {
  value = module.apprun.apprun_fcm_public_url
}

output "apns_internal_api_public_url" {
  value = module.apprun.apprun_apns_public_url
}
