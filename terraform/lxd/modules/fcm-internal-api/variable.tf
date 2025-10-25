variable "container_name" {
  type        = string
  description = "Name of the LXD container"
  default     = "flutterkaigi-2025-fcm-internal-api-stg"
}

variable "firebase_service_account_json" {
  type        = string
  description = "Firebase Service Account JSON as a string"
  sensitive   = true
}

variable "docker_image" {
  type        = string
  description = "Docker image to use (e.g., ghcr.io/flutterkaigi/fcm-internal-api:latest)"
}

variable "docker_registry_address" {
  type        = string
  description = "Docker registry address"
}

variable "docker_registry_username" {
  type        = string
  description = "Docker registry username"
  sensitive   = true
}

variable "docker_registry_password" {
  type        = string
  description = "Docker registry password"
  sensitive   = true
}

variable "cpu_limit" {
  type        = number
  description = "CPU limit for the container"
  default     = 2
}

variable "memory_limit" {
  type        = string
  description = "Memory limit for the container"
  default     = "4GB"
}

variable "disk_size" {
  type        = string
  description = "Disk size for the container"
  default     = "20GB"
}
