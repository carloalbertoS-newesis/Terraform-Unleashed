terraform {
    required_version = ">= 1.4.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file("service_account.json")

  project = var.projectId
  region  = var.region
  zone    = var.zone
}
