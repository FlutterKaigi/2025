resource "docker_image" "fcm_notification" {
  name = "${var.docker_registry_address}/fcm-notification:latest"
  platform = "linux/amd64"
  keep_locally = true
  build {
    context = "${local.source_root}/bff/fcm-notification"
    dockerfile = "${local.source_root}/bff/fcm-notification/Dockerfile"
    platform = "linux/amd64"
  }
  triggers = {
    timestamp = timestamp()
  }
}

resource "docker_registry_image" "fcm_notification" {
  name = "${var.docker_registry_address}/fcm-notification"
  keep_remotely = true
  triggers = {
    image_id = docker_image.fcm_notification.image_id
  }
}

output "docker_image_fcm_notification_sha256" {
  value = trimprefix(docker_registry_image.fcm_notification.sha256_digest, "sha256:")
}

