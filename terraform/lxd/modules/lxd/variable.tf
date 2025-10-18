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
