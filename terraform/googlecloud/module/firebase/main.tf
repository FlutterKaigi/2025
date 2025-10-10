locals {
  package_name = "jp.flutterkaigi.conf2025${var.package_name_suffix}"
  team_id      = "6JT949BA2M"
  sha1_fingerprints = [
    // Google Play Console
    "FF:7D:68:E1:DD:52:C4:31:E1:D7:28:5E:20:FD:B8:AB:EB:23:AE:D1",
    // Android Debug Key
    "70:6B:56:2F:97:28:D4:FD:15:1A:FB:46:83:70:DD:C7:63:98:DB:7D"
  ]
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = var.project_id
}

resource "google_firebase_android_app" "android" {
  provider = google-beta

  project      = var.project_id
  display_name = "FlutterKaigi 2025 ${var.env} Android App"
  package_name = local.package_name

}

resource "google_firebase_apple_app" "ios" {
  provider = google-beta

  project      = var.project_id
  display_name = "FlutterKaigi 2025 ${var.env} iOS App"
  bundle_id    = local.package_name
  team_id      = local.team_id
}



resource "google_firebase_web_app" "web" {
  provider     = google-beta
  project      = var.project_id
  display_name = "FlutterKaigi 2025 ${var.env} Web App"
}
