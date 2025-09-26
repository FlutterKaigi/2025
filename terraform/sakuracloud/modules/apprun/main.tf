resource "sakuracloud_apprun_application" "flutterkaigi-2025-bff" {
  name            = "flutterkaigi-2025-bff-${var.env}"
  timeout_seconds = 20
  port            = 8080
  max_scale       = var.app_run_max_scale
  min_scale       = 1
  components {
    max_cpu    = "1"
    max_memory = "1Gi"
    name       = "bff-${var.env}"
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
  }
  # lifecycle {
  #   prevent_destroy = true
  # }
}


output "apprun_public_url" {
  value = sakuracloud_apprun_application.flutterkaigi-2025-bff.public_url
}
