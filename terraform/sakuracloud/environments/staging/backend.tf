terraform {
  required_version = "1.13.4"
  backend "s3" {
    bucket                      = "tf-state"
    key                         = "flutterkaigi-2025-sakuracloud-staging.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
    endpoints                   = { s3 = "https://cdd8f59359fe226645e7b541cdc53b57.r2.cloudflarestorage.com" }
  }
}
