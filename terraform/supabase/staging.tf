resource "supabase_project" "staging" {
  organization_id   = var.SUPABASE_ORGANIZATION_ID
  name              = "flutterkaigi-2025-staging"
  database_password = var.SUPABASE_DB_PASSWORD_STAGING
  region            = "ap-northeast-1"

  lifecycle {
    ignore_changes = [database_password]
  }
}

data "supabase_apikeys" "staging" {
  project_ref = supabase_project.staging.id
}

output "supabase_staging_anon_key" {
  value     = data.supabase_apikeys.staging.anon_key
  sensitive = true
}

output "supabase_staging_service_role_key" {
  value     = data.supabase_apikeys.staging.service_role_key
  sensitive = true
}

output "supabase_staging_project_id" {
  value = supabase_project.staging.id
}

resource "supabase_settings" "staging" {
  project_ref = supabase_project.staging.id

  # https://api.supabase.com/api/v1#tag/rest/patch/v1/projects/{ref}/postgrest
  api = jsonencode({
    db_schema            = ""
    db_extra_search_path = ""
    max_rows             = 0
  })

  # https://api.supabase.com/api/v1#tag/auth/patch/v1/projects/{ref}/config/auth
  auth = jsonencode({
    external_email_enabled                = false
    external_anonymous_users_enabled      = true
    external_google_enabled               = true
    external_google_additional_client_ids = null
    external_google_client_id             = var.SUPABASE_GOOGLE_AUTH_CLIENT_ID
    external_google_secret                = var.SUPABASE_GOOGLE_AUTH_CLIENT_SECRET
    external_google_skip_nonce_check      = true
    security_manual_linking_enabled       = true
    uri_allow_list                        = "http://localhost:3000,https://*.flutter-kaigi.workers.dev,jp.flutterkaigi.conf2025.stg://login-callback"
  })
}
