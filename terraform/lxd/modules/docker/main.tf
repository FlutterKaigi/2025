locals {
  source_root = abspath("${path.module}/../../../../")
}

# FCM Internal API イメージのビルド
resource "docker_image" "fcm_internal_api" {
  name         = "${var.docker_registry_address}/fcm-internal-api:${var.image_tag}"
  platform     = "linux/amd64"
  keep_locally = true
  build {
    context    = "${local.source_root}/bff/fcm-internal-api"
    dockerfile = "${local.source_root}/bff/fcm-internal-api/Dockerfile"
    platform   = "linux/amd64"
  }
  triggers = {
    timestamp = timestamp()
  }
}

# レジストリへのプッシュ
resource "docker_registry_image" "fcm_internal_api" {
  name          = "${var.docker_registry_address}/fcm-internal-api"
  keep_remotely = true

  triggers = {
    image_id = docker_image.fcm_internal_api.image_id
  }
}


