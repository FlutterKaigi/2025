resource "supabase_project" "production" {
  organization_id   = var.SUPABASE_ORGANIZATION_ID
  name              = "flutterkaigi-2025-production"
  database_password = var.SUPABASE_DB_PASSWORD_PRODUCTION
  region            = "ap-northeast-1"

  lifecycle {
    ignore_changes = [database_password]
  }
}

data "supabase_apikeys" "production" {
  project_ref = supabase_project.production.id
}

output "supabase_production_anon_key" {
  value     = data.supabase_apikeys.production.anon_key
  sensitive = true
}

output "supabase_production_service_role_key" {
  value     = data.supabase_apikeys.production.service_role_key
  sensitive = true
}

output "supabase_production_project_id" {
  value = supabase_project.production.id
}

resource "supabase_settings" "production" {
  project_ref = supabase_project.production.id

  # https://api.supabase.com/api/v1#tag/auth/PATCH/v1/projects/{ref}/config/auth
  api = jsonencode({
    db_schema                             = "public,graphql_public"
    db_extra_search_path                  = "public,extensions"
    max_rows                              = 1000
    external_google_enabled               = true
    external_google_client_id             = var.SUPABASE_GOOGLE_CLIENT_ID
    external_google_secret                = var.SUPABASE_GOOGLE_CLIENT_SECRET
    external_google_additional_client_ids = null
    external_google_skip_nonce_check      = true
  })
}
