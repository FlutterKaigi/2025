variable "docker_registry_address" {
  type        = string
  description = "Docker registry address (e.g., ghcr.io/flutterkaigi)"
}

variable "docker_registry_username" {
  type        = string
  description = "Docker registry username"
  sensitive   = true
}

variable "docker_registry_password" {
  type        = string
  description = "Docker registry password or token"
  sensitive   = true
}

variable "image_tag" {
  type        = string
  description = "Image tag to use"
  default     = "latest"
}


