resource "google_project" "default" {
  provider = google-beta.no_user_project_override

  name       = "FlutterKaigi 2025 ${var.env}"
  project_id = "flutterkaigi2025-${var.env}"

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

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = google_project.default.project_id

  depends_on = [
    google_project_service.default
  ]
}

resource "google_firebase_android_app" "android" {
  provider = google-beta

  project      = google_project.default.project_id
  display_name = "FlutterKaigi 2025 ${var.env} Android App"
  package_name = "jp.flutterkaigi.conf2025${var.package_name_suffix}"

  depends_on = [
    google_firebase_project.default,
  ]
}

resource "google_firebase_apple_app" "ios" {
  provider = google-beta

  project      = google_project.default.project_id
  display_name = "FlutterKaigi 2025 ${var.env} iOS App"
  bundle_id    = "jp.flutterkaigi.conf2025${var.package_name_suffix}"

  depends_on = [
    google_firebase_project.default,
  ]
}


resource "google_firebase_web_app" "web" {
  provider     = google-beta
  project      = google_project.default.project_id
  display_name = "FlutterKaigi 2025 ${var.env} Web App"


  depends_on = [
    google_firebase_project.default,
  ]
}
