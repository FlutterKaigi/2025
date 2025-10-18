resource "lxd_instance" "flutterkaigi-2025-monitoring" {
  name      = "flutterkaigi-2025-monitoring"
  image     = "ubuntu:24.04"
  ephemeral = false

  config = {
    "cloud-init.user-data" = templatefile("${path.module}/cloud-init.yaml.tftpl", {
      tunnel_token = var.CLOUDFLARE_TUNNEL_TOKEN
    })
    "security.nesting" = "true"
    "raw.idmap"        = "both 1000 1000"
  }

  limits = {
    cpu    = 8
    memory = "16GB"
  }

  type = "container"

  device {
    name = "root"
    type = "disk"
    properties = {
      path = "/"
      pool = "default"
      size = "100GB"
    }
  }
}
