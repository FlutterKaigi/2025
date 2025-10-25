output "container_name" {
  description = "Name of the created LXD container"
  value       = lxd_instance.fcm_internal_api.name
}

output "container_ipv4" {
  description = "IPv4 address of the container"
  value       = lxd_instance.fcm_internal_api.ipv4_address
}

output "container_ipv6" {
  description = "IPv6 address of the container"
  value       = lxd_instance.fcm_internal_api.ipv6_address
}

