locals {
  env = "staging"
}

variable "LXD_TOKEN" {
  type        = string
  description = "LXD authentication token"
  sensitive   = true
}

variable "DOCKER_REGISTRY_ADDRESS" {
  type        = string
  description = "Docker registry address (e.g., ghcr.io/flutterkaigi)"
}

variable "DOCKER_REGISTRY_USERNAME" {
  type        = string
  description = "Docker registry username"
  sensitive   = true
}

variable "DOCKER_REGISTRY_PASSWORD" {
  type        = string
  description = "Docker registry password or token"
  sensitive   = true
}

variable "FIREBASE_SERVICE_ACCOUNT_JSON_STAGING" {
  type        = string
  description = "Firebase Service Account JSON for staging"
  sensitive   = true
}


