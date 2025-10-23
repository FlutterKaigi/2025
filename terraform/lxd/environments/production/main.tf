module "tls" {
  source = "../../modules/tls"

  CLOUDFLARE_ZONE = local.CLOUDFLARE_ZONE
}

module "cloudflare" {
  source = "../../modules/cloudflare"

  CLOUDFLARE_ACCOUNT_ID                            = var.CLOUDFLARE_ACCOUNT_ID
  CLOUDFLARE_ZONE_ID                               = var.CLOUDFLARE_ZONE_ID
  CLOUDFLARE_ZONE                                  = local.CLOUDFLARE_ZONE
  CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_ID     = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_ID
  CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_SECRET = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_SECRET
  CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID     = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID
  CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET
  ALLOY_GRPC_CSR                                   = module.tls.cert_request_pem
}

module "lxd" {
  source                                           = "../../modules/lxd"
  CLOUDFLARE_TUNNEL_TOKEN                          = module.cloudflare.cloudflare_tunnel_token
  CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID     = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID
  CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET
  CLOUDFLARE_ALLY_GRPC_CERTIFICATE                 = module.cloudflare.alloy_grpc_certificate
  CLOUDFLARE_ALLOY_GRPC_PRIVATE_KEY                = module.tls.private_key_pem
}
