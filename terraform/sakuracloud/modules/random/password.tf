resource "random_password" "container_registry_password" {
  length           = 16
  override_special = "-.@_*"
}

output "container_registry_password" {
  value = random_password.container_registry_password.result
  sensitive = true
}
