locals {
  container_registry_username = "registry"
}

resource "sakuracloud_container_registry" "registry" {
  name            = "flutterkaigi-2025-bff-${var.env}"
  access_level    = "none"
  subdomain_label = "flutterkaigi-2025-bff-${var.env}"
  user {
    name       = local.container_registry_username
    password   = var.container_registry_password
    permission = "readwrite"
  }
  tags = ["flutterkaigi-2025", "${var.env}"]
}


output "container_registry_fqdn" {
  value = sakuracloud_container_registry.registry.fqdn
}

output "container_registry_username" {
  value = local.container_registry_username
}

output "container_registry_password" {
  value = var.container_registry_password
  sensitive = true
}
