
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "test-vpc" {
  name = "${var.network_name}-${var.userId}"
  auto_create_subnetworks = var.network_createSubnet
  mtu                     = var.network_mtu
}

