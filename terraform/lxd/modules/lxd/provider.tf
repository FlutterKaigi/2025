terraform {
  required_providers {
    # https://registry.terraform.io/providers/terraform-lxd/lxd/latest/docs
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "2.5.0"
    }
  }
}


provider "lxd" {
  accept_remote_certificate = true

  remote {
    name    = "rx2530"
    address = "https://100.87.140.68:443"
    default = true
  }
}
