terraform {
  required_version = "1.13.3"
  required_providers {
    sakuracloud = {
      # https://registry.terraform.io/providers/sacloud/sakuracloud/latest
      source  = "sacloud/sakuracloud"
      version = "2.29.1"
    }
  }
}

provider "sakuracloud" {
  token  = var.SAKURACLOUD_ACCESS_TOKEN
  secret = var.SAKURACLOUD_ACCESS_TOKEN_SECRET
}
