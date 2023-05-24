# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "test-vpc" {
  name = "${var.network_name}-${var.userId}"
  auto_create_subnetworks = var.network_createSubnet
  mtu                     = var.network_mtu
}

#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

/* resource "google_compute_subnetwork" "regional-subnet" {
  name          = var.network_subnetName
  ip_cidr_range = var.network_subnetIpCidrRange
  region        = var.region
  network       = google_compute_network.test-vpc.id

}

resource "google_compute_subnetwork" "regional-subnet2" {
  name          = var.network_subnetName2
  ip_cidr_range = var.network_subnetIpCidrRange2
  region        = var.region
  network       = google_compute_network.test-vpc.id

}
 */
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "regional-subnetworks" {
  count                = length(var.network_subnetInfo)
  name          = lookup(element(var.network_subnetInfo, count.index), "name")
  ip_cidr_range = lookup(element(var.network_subnetInfo, count.index), "ip")
  region        = var.region
  network       = google_compute_network.test-vpc.id

}
