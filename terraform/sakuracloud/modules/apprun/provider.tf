terraform {
  required_version = "1.13.4"
  required_providers {
    sakuracloud = {
      # https://registry.terraform.io/providers/sacloud/sakuracloud/latest
      source  = "sacloud/sakuracloud"
      version = "2.30.0"
    }
  }
}

provider "sakuracloud" {
  token  = var.SAKURACLOUD_ACCESS_TOKEN
  secret = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
}
