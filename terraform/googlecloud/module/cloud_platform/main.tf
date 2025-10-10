locals {
  project_id = "flutterkaigi2025-${var.env_short}-8f66"
}

resource "google_project" "default" {
  provider = google-beta.no_user_project_override

  name       = "FlutterKaigi 2025 ${var.env}"
  project_id = local.project_id

  labels = {
    "firebase" = "enabled"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_project_service" "default" {
  provider = google-beta.no_user_project_override
  project  = google_project.default.project_id
  for_each = toset([
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "firebase.googleapis.com",
    "serviceusage.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}


output "project_id" {
  value       = local.project_id
  description = "Project ID"
}
