locals {
  CLOUDFLARE_ZONE = "flutterkaigi.jp"
  CLOUDFLARE_EMAILS = [
    "yumnumm@gmail.com",
  ]
}

variable "CLOUDFLARE_API_TOKEN" {
  type        = string
  description = "Cloudflare API Token"
  sensitive   = true
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  type        = string
  description = "Cloudflare Account ID"
  sensitive   = true
}

variable "CLOUDFLARE_ZONE_ID" {
  type        = string
  description = "Cloudflare Zone ID"
  sensitive   = true
}

variable "CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_ID" {
  type        = string
  description = "Cloudflare Zero Trust OAuth GitHub Client ID"
  sensitive   = true
}

variable "CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_SECRET" {
  type        = string
  description = "Cloudflare Zero Trust OAuth GitHub Client Secret"
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
