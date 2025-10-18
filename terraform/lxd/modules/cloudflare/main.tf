resource "cloudflare_zero_trust_tunnel_cloudflared" "monitoring_tunnel" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "flutterkaigi-2025-monitoring"
  config_src = "cloudflare"
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "monitoring_tunnel_token" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.monitoring_tunnel.id
}

resource "cloudflare_dns_record" "otlp_http_record" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  name    = "otlp"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.monitoring_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "alloy_http_record" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  name    = "alloy"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.monitoring_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "grafana_http_record" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  name    = "grafana"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.monitoring_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_zero_trust_access_identity_provider" "github" {
  name    = "GitHub"
  type    = "github"
  zone_id = var.CLOUDFLARE_ZONE_ID
  scim_config = {
    enabled                  = true
    identity_update_behavior = "automatic"
    seat_deprovision         = true
    user_deprovision         = true
  }
  config = {
    client_id     = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_ID
    client_secret = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GITHUB_CLIENT_SECRET
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "google-workspace" {
  name = "Google"
  type = "google"
  zone_id = var.CLOUDFLARE_ZONE_ID
  config = {
    client_id = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_ID
    client_secret = var.CLOUDFLARE_ZERO_TRUST_OAUTH_GOOGLE_CLIENT_SECRET
  }
}

resource "cloudflare_zero_trust_access_identity_provider" "onetimepin_login" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "One-time PIN login"
  type       = "onetimepin"
  config     = {}
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "monitoring_tunnel_config" {
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.monitoring_tunnel.id
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  config = {
    ingress = [
      {
        hostname = "otlp.${var.CLOUDFLARE_ZONE}"
        service  = "http://alloy:4318" # OTLP HTTP receiver
      },
      {
        hostname = "alloy.${var.CLOUDFLARE_ZONE}"
        service  = "http://alloy:12345" # Alloy UI
      },
      {
        hostname = "grafana.${var.CLOUDFLARE_ZONE}"
        service  = "http://grafana:3000" # Grafana UI
      },
      {
        service = "http_status:404"
      }
    ]
  }
}

resource "cloudflare_zero_trust_access_policy" "allow_emails" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "Allow email addresses"
  decision   = "allow"
  include = [{
    email_domain = {
      domain = "@${var.CLOUDFLARE_ZONE}"
    }
  }]
}

resource "cloudflare_zero_trust_access_policy" "allow_github_org" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "Allow GitHub organization"
  decision   = "allow"
  include = [{
    github_organization = {
      identity_provider_id = cloudflare_zero_trust_access_identity_provider.github.id
      name                 = "FlutterKaigi"
      team                 = "FlutterKaigi"
    }
  }]
}

resource "cloudflare_zero_trust_access_application" "alloy_application" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "Alloy"
  domain     = "alloy.${var.CLOUDFLARE_ZONE}"
  type       = "self_hosted"
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.allow_emails.id
      precedence = 1
    },
    {
      id         = cloudflare_zero_trust_access_policy.allow_github_org.id
      precedence = 2
    }
  ]
}

resource "cloudflare_zero_trust_access_application" "grafana_application" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "Grafana"
  domain     = "grafana.${var.CLOUDFLARE_ZONE}"
  type       = "self_hosted"
  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.allow_emails.id
      precedence = 1
    },
    {
      id         = cloudflare_zero_trust_access_policy.allow_github_org.id
      precedence = 2
    }
  ]
}


output "cloudflare_tunnel_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.monitoring_tunnel_token.token
  sensitive = true
}
