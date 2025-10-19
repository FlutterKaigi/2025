terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.1.0"
    }
  }
}

resource "tls_private_key" "alloy_grpc" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_cert_request" "alloy_grpc" {
  private_key_pem = tls_private_key.alloy_grpc.private_key_pem

  subject {
    common_name  = "alloy-grpc.${var.CLOUDFLARE_ZONE}"
    organization = "FlutterKaigi"
  }

  dns_names = [
    "alloy-grpc.${var.CLOUDFLARE_ZONE}",
  ]
}
