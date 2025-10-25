resource "docker_image" "bff" {
  name         = "${var.docker_registry_address}/bff:latest"
  platform     = "linux/amd64"
  keep_locally = true
  build {
    context    = local.source_root
    dockerfile = "${local.source_root}/bff/engine/Dockerfile"
    platform   = "linux/amd64"
  }
  triggers = {
    timestamp = timestamp()
  }
}

resource "docker_registry_image" "bff" {
  name          = "${var.docker_registry_address}/bff"
  keep_remotely = true

  triggers = {
    image_id = docker_image.bff.image_id
  }
}

output "docker_image_bff_sha256" {
  value = trimprefix(docker_registry_image.bff.sha256_digest, "sha256:")
}
