output "fcm_internal_api_container_name" {
  description = "Name of the FCM Internal API container"
  value       = module.fcm_internal_api.container_name
}

output "fcm_internal_api_ipv4" {
  description = "IPv4 address of the FCM Internal API container"
  value       = module.fcm_internal_api.container_ipv4
}

output "fcm_internal_api_image" {
  description = "Docker image used for FCM Internal API"
  value       = module.docker.fcm_internal_api_image
}


