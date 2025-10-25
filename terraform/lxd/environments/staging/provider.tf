terraform {
  required_version = ">= 1.5"

  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "~> 2.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "lxd" {
  generate_client_certificates = false
  accept_remote_certificate    = true

  lxd_remote {
    name     = "default"
    scheme   = "https"
    address  = "10.1.1.6"
    password = var.LXD_TOKEN
    default  = true
  }
}


