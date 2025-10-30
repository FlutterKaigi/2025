terraform {
  required_version = "1.13.4"

  required_providers {
    docker = {
      # https://registry.terraform.io/providers/kreuzwerker/docker/latest
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  registry_auth {
    address  = var.docker_registry_address
    username = var.docker_registry_username
    password = var.docker_registry_password
  }
}
