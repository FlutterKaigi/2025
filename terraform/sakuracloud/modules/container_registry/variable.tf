variable "env" {
  type        = string
  description = "Environment"
}

variable "container_registry_password" {
  type        = string
  description = "Container Registry Password"
  sensitive   = true
}

variable "SAKURACLOUD_ACCESS_TOKEN" {
  type        = string
  description = "SakuraCloud Access Token"
  sensitive   = true
}

variable "SAKURACLOUD_ACCESS_TOKEN_SECRET" {
  type        = string
  description = "SakuraCloud Access Token Secret"
  sensitive   = true
}
