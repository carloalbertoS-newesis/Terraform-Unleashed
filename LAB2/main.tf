
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "regional-subnet" {
  name          = var.network_subnetName
  ip_cidr_range = var.network_subnetIpCidrRange
  region        = var.region
  network       = google_compute_network.test-vpc.id

}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "test-vpc" {
  name = "${var.network_name}-${var.userId}"
  auto_create_subnetworks = var.network_createSubnet
  mtu                     = var.network_mtu
}

