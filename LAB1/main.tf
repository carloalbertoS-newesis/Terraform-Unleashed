terraform {
    required_version = ">= 1.4.0"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

# test commit
provider "google" {
  credentials = file("service_account.json")

  project = "corso-terraform"
  region  = "europe-west12"
  zone    = "europe-west12-a"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "test-vpc" {
  name = "terraform-network-lab1"
}

