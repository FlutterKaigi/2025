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

variable "enable_fcm_internal_api" {
  type        = bool
  description = "Enable FCM Internal API"
}

variable "firebase_service_account_json" {
  type        = string
  description = "Firebase Service Account JSON"
  sensitive   = true
}

locals {
  source_root = "${path.module}/../../../../"
}
