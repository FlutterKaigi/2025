terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
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


