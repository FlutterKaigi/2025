locals {
  env                         = "staging"
  container_registry_password = random_password.container_registry_password.result
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
