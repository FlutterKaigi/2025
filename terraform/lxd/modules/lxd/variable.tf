variable "CLOUDFLARE_TUNNEL_TOKEN" {
  type        = string
  description = "Cloudflare Tunnel Token"
  sensitive   = true
}

variable "CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID" {
  type        = string
  description = "Cloudflare Zero Trust OAuth Google Client ID"
  sensitive   = true
}

variable "CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET" {
  type        = string
  description = "Cloudflare Zero Trust OAuth Google Client Secret"
  sensitive   = true
}

variable "CLOUDFLARE_ALLY_GRPC_CERTIFICATE" {
  type        = string
  description = "Cloudflare Alloy gRPC Certificate"
  sensitive   = true
}

variable "CLOUDFLARE_ALLOY_GRPC_PRIVATE_KEY" {
  type        = string
  description = "Cloudflare Alloy gRPC Private Key"
  sensitive   = true
}
