resource "docker_image" "fcm-internal-api" {
  count        = var.enable_fcm_internal_api ? 1 : 0
  name         = "${var.docker_registry_address}/fcm-internal-api:latest"
  platform     = "linux/amd64"
  keep_locally = true
  build {
    context  = "${local.source_root}/bff/fcm-internal-api"
    platform = "linux/amd64"
    build_args = {
      FIREBASE_SERVICE_ACCOUNT_JSON : var.firebase_service_account_json
    }
    label = {
      builder = "terraform"
    }
  }
  triggers = {
    timestamp = timestamp()
  }
}

resource "docker_registry_image" "fcm-internal-api" {
  count         = var.enable_fcm_internal_api ? 1 : 0
  name          = "${var.docker_registry_address}/fcm-internal-api"
  keep_remotely = true

  triggers = {
    image_id = docker_image.fcm-internal-api[0].image_id
  }
}

output "docker_image_fcm-internal-api_sha256" {
  value = var.enable_fcm_internal_api ? trimprefix(docker_registry_image.fcm-internal-api[0].sha256_digest, "sha256:") : ""
}
