terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)
}

module "vpc" {
  source  = "./modules/vpc"
  project = var.project
  region  = var.region
  name    = var.name
}