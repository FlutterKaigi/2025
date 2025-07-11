variable "SUPABASE_ACCESS_TOKEN" {
  type        = string
  description = "Supabase Access Token"
  sensitive   = true
}

variable "SUPABASE_ORGANIZATION_ID" {
  type        = string
  description = "Supabase Organization ID"
}

variable "SUPABASE_DB_PASSWORD_PRODUCTION" {
  type        = string
  description = "Production Database Password"
  sensitive   = true
}

variable "SUPABASE_DB_PASSWORD_STAGING" {
  type        = string
  description = "Staging Database Password"
  sensitive   = true
}


variable "SUPABASE_GOOGLE_AUTH_CLIENT_ID" {
  type        = string
  description = "Google Auth Client ID"
}

variable "SUPABASE_GOOGLE_AUTH_CLIENT_SECRET" {
  type        = string
  description = "Google Auth Client Secret"
  sensitive   = true
}
