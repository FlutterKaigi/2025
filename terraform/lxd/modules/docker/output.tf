output "fcm_internal_api_image" {
  description = "Full image name with tag for FCM Internal API"
  value       = "${var.docker_registry_address}/fcm-internal-api:${var.image_tag}"
}

output "fcm_internal_api_sha256" {
  description = "SHA256 digest of the FCM Internal API image"
  value       = trimprefix(docker_registry_image.fcm_internal_api.sha256_digest, "sha256:")
}


