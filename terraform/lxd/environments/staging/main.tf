locals {
  env = "staging"
}

# Docker イメージのビルドとプッシュ
module "docker" {
  source                   = "../../modules/docker"
  docker_registry_address  = var.DOCKER_REGISTRY_ADDRESS
  docker_registry_username = var.DOCKER_REGISTRY_USERNAME
  docker_registry_password = var.DOCKER_REGISTRY_PASSWORD
  image_tag                = "staging-${formatdate("YYYYMMDDhhmmss", timestamp())}"
}

# FCM Internal API の LXD コンテナ
module "fcm_internal_api" {
  source                        = "../../modules/fcm-internal-api"
  container_name                = "flutterkaigi-2025-fcm-internal-api-stg"
  firebase_service_account_json = var.FIREBASE_SERVICE_ACCOUNT_JSON_STAGING
  docker_image                  = module.docker.fcm_internal_api_image
  docker_registry_address       = var.DOCKER_REGISTRY_ADDRESS
  docker_registry_username      = var.DOCKER_REGISTRY_USERNAME
  docker_registry_password      = var.DOCKER_REGISTRY_PASSWORD
  cpu_limit                     = 2
  memory_limit                  = "4GB"
  disk_size                     = "20GB"

  depends_on = [module.docker]
}


