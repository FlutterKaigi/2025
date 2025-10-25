
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
