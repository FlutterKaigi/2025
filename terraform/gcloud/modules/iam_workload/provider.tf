terraform {
  required_providers {
    # https://registry.terraform.io/providers/hashicorp/google/latest
    google = {
      source = "hashicorp/google"
      version = "7.5.0"
    }
  }
}

provider "google" {
  project = var.PROJECT_ID
  region = var.REGION
}
