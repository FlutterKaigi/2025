variable "docker_registry_address" {
  type        = string
  description = "Docker Registry Address"
}

variable "docker_registry_username" {
  type        = string
  description = "Docker Registry Username"
}

variable "docker_registry_password" {
  type        = string
  description = "Docker Registry Password"
  sensitive   = true
}


locals {
  source_root = "${path.module}/../../../../"
}
