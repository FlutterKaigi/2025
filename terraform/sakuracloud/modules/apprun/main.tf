resource "sakuracloud_apprun_application" "flutterkaigi-2025-bff" {
  name            = "flutterkaigi-2025-${var.env}"
  timeout_seconds = 20
  port            = 8080
  max_scale       = var.app_run_max_scale
  min_scale       = 1
  components {
    max_cpu    = "1"
    max_memory = "1Gi"
    name       = var.env
    deploy_source {
      container_registry {
        image    = "${var.container_registry_fqdn}/bff:latest"
        password = var.container_registry_password
        server   = var.container_registry_fqdn
        username = var.container_registry_username
      }
    }
    probe {
      http_get {
        path = "/health"
        port = 8080
      }
    }
    env {
      key   = "POSTGRES_URL"
      value = "postgresql://postgres.${var.supabase_project_id}:${var.supabase_db_password}@aws-0-ap-northeast-1.pooler.supabase.com:5432/postgres"
    }
    env {
      key   = "SUPABASE_URL"
      value = "https://${var.supabase_project_id}.supabase.co"
    }
    env {
      key   = "SUPABASE_SERVICE_ROLE_KEY"
      value = var.supabase_service_role_key
    }
    env {
      key   = "INTERNAL_API_URL"
      value = var.internal_api_url
    }
    env {
      key   = "CF_VERSION_METADATA_TAG"
      value = "sakura-${var.env}-${var.container_image_id}"
    }
    env {
      key   = "CF_VERSION_METADATA_ID"
      value = var.container_image_id
    }
    env {
      key   = "CF_VERSION_METADATA_TIMESTAMP"
      value = timestamp()
    }
    env {
      key   = "X_API_KEY"
      value = var.X_API_KEY
    }
    env {
      key   = "LOGO_BASE_URL"
      value = var.logo_base_url
    }
    env {
      key   = "CLOUDFLARE_ACCOUNT_ID"
      value = var.cloudflare_account_id
    }
    env {
      key   = "R2_BUCKET_NAME"
      value = var.r2_bucket_name
    }
    env {
      key   = "R2_ACCESS_KEY_ID"
      value = var.r2_access_key_id
    }
    env {
      key   = "R2_SECRET_ACCESS_KEY"
      value = var.r2_secret_access_key
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}


output "apprun_public_url" {
  value = sakuracloud_apprun_application.flutterkaigi-2025-bff.public_url
}


resource "sakuracloud_apprun_application" "fcm_internal_api" {
  name            = "fcm-internal-api-${var.env}"
  timeout_seconds = 20
  port            = 8080
  max_scale       = var.app_run_max_scale
  min_scale       = 1
  components {
    max_cpu    = "1"
    max_memory = "1Gi"
    name       = var.env
    deploy_source {
      container_registry {
        image    = "${var.container_registry_fqdn}/fcm-internal-api:latest"
        password = var.container_registry_password
        server   = var.container_registry_fqdn
        username = var.container_registry_username
      }
    }
    probe {
      http_get {
        path = "/health"
        port = 8080
      }
    }
    env {
      key   = "X_API_KEY"
      value = var.X_API_KEY
    }
    env {
      key   = "FIREBASE_SERVICE_ACCOUNT_JSON"
      value = var.firebase_service_account_json
    }
    env {
      key   = "NODE_ENV"
      value = "production"
    }
    env {
      key = "BUILD_TIMESTAMP"
      value = timestamp()
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

output "apprun_fcm_public_url" {
  value = sakuracloud_apprun_application.fcm_internal_api.public_url
}

resource "sakuracloud_apprun_application" "apns_internal_api" {
  name            = "apns-internal-api-${var.env}"
  timeout_seconds = 20
  port            = 8080
  max_scale       = var.app_run_max_scale
  min_scale       = 1
  components {
    max_cpu    = "1"
    max_memory = "1Gi"
    name       = var.env
    deploy_source {
      container_registry {
        image    = "${var.container_registry_fqdn}/apns-internal-api:latest"
        password = var.container_registry_password
        server   = var.container_registry_fqdn
        username = var.container_registry_username
      }
    }
    probe {
      http_get {
        path = "/health"
        port = 8080
      }
    }
    env {
      key   = "X_API_KEY"
      value = var.X_API_KEY
    }
    env {
      key   = "APNS_KEY_ID"
      value = var.apns_key_id
    }
    env {
      key   = "APNS_TEAM_ID"
      value = var.apns_team_id
    }
    env {
      key   = "APNS_PRIVATE_KEY"
      value = var.apns_private_key
    }
    env {
      key   = "APNS_ENVIRONMENT"
      value = var.apns_environment
    }
    env {
      key   = "LOG_LEVEL"
      value = "info"
    }
    env {
      key = "BUILD_TIMESTAMP"
      value = timestamp()
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

output "apprun_apns_public_url" {
  value = sakuracloud_apprun_application.apns_internal_api.public_url
}
