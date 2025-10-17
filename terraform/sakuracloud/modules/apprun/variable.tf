variable "env" {
  type        = string
  description = "Environment"
}

variable "app_run_max_scale" {
  type        = number
  description = "App Run Max Scale"
  default     = 5
}

variable "container_registry_fqdn" {
  type        = string
  description = "Container Registry FQDN"
}

variable "container_registry_username" {
  type        = string
  description = "Container Registry Username"
}

variable "container_registry_password" {
  type        = string
  description = "Container Registry Password"
  sensitive   = true
}

variable "container_image_id" {
  type        = string
  description = "Container Image ID"
}

variable "supabase_project_id" {
  type        = string
  description = "Supabase Project ID"
  sensitive   = true
}

variable "supabase_service_role_key" {
  type        = string
  description = "Supabase Service Role Key"
  sensitive   = true
}

variable "supabase_db_password" {
  type        = string
  description = "Supabase DB Password"
  sensitive   = true
}

variable "internal_api_url" {
  type        = string
  description = "Internal API URL"
  sensitive   = true
}

variable "X_API_KEY" {
  type        = string
  description = "X API Key"
  sensitive   = true
}

variable "logo_base_url" {
  type        = string
  description = "Logo Base URL"
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

variable "deployment_timestamp" {
  type        = string
  description = "Deployment timestamp (static value to avoid plan inconsistencies)"
  default     = "2024-01-01T00:00:00Z"
}

variable "firebase_service_account_json" {
  type        = string
  description = "Firebase Service Account JSON"
  sensitive   = true
}
