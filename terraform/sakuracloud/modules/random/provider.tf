terraform {
  required_version = "1.13.3"
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/random
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}
