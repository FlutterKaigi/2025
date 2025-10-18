locals {
  env                         = "staging"
  container_registry_password = module.random_password.container_registry_password
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

variable "X_API_KEY" {
  type        = string
  description = "X API Key"
  sensitive   = true
}

variable "SUPABASE_DB_PASSWORD_STAGING" {
  type        = string
  description = "Supabase DB Password (Staging)"
  sensitive   = true
}

variable "SUPABASE_SERVICE_ROLE_KEY_STAGING" {
  type        = string
  description = "Supabase Service Role Key"
  sensitive   = true
}

variable "R2_ACCESS_KEY_ID" {
  type        = string
  description = "R2 Access Key ID"
  sensitive   = true
}

variable "R2_SECRET_ACCESS_KEY" {
  type        = string
  description = "R2 Secret Access Key"
  sensitive   = true
}
