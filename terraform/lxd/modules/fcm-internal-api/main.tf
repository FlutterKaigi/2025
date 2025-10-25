resource "lxd_instance" "fcm_internal_api" {
  name      = var.container_name
  image     = "ubuntu:24.04"
  ephemeral = false

  config = {
    "cloud-init.user-data" = templatefile("${path.module}/cloud-init.yaml.tftpl", {
      firebase_service_account_json = var.firebase_service_account_json
      docker_image                  = var.docker_image
      docker_registry_address       = var.docker_registry_address
      docker_registry_auth          = base64encode("${var.docker_registry_username}:${var.docker_registry_password}")
    })
    "security.nesting" = "true"
    "raw.idmap"        = "both 1000 1000"
  }

  limits = {
    cpu    = var.cpu_limit
    memory = var.memory_limit
  }

  type = "container"

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = "default"
      size = var.disk_size
    }
  }
}
