resource "lxd_instance" "flutterkaigi-2025-monitoring" {
  name      = "flutterkaigi-2025-monitoring"
  image     = "ubuntu:24.04"
  ephemeral = false

  config = {
    "cloud-init.user-data" = templatefile("${path.module}/cloud-init.yaml.tftpl", {
      tunnel_token         = var.CLOUDFLARE_TUNNEL_TOKEN
      google_client_id     = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID
      google_client_secret = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET
      alloy_grpc_cert      = var.CLOUDFLARE_ALLY_GRPC_CERTIFICATE
      alloy_grpc_key       = var.CLOUDFLARE_ALLOY_GRPC_PRIVATE_KEY
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
