resource "sakuracloud_apprun_application" "flutterkaigi-2025-fcm-internal-api" {
  name            = "flutterkaigi-2025-fcm-internal-api-${var.env}${var.name_suffix}"
  timeout_seconds = 20
  port            = 8080
  min_scale       = 1
  max_scale       = var.app_run_max_scale
  components {
    max_cpu    = "1"
    max_memory = "2Gi"
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
      key   = "CF_VERSION_METADATA_TIMESTAMP"
      value = timestamp()
    }
    env {
      key   = "X_API_KEY"
      value = var.X_API_KEY
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}


output "apprun_fcm_internal_api_public_url" {
  value = sakuracloud_apprun_application.flutterkaigi-2025-fcm-internal-api.public_url
}
