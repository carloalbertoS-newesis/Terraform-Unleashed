# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network

resource "google_compute_network" "main-vpc" {
  name = "${var.projectId}-${var.userId}-vpc"
  auto_create_subnetworks = var.auto_create_subnetworks
  mtu                     = var.mtu
}


#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

resource "google_compute_subnetwork" "regional-subnetworks" {
  count                = length(var.subnetInfo)
  name          = "${var.region}-${lookup(element(var.subnetInfo, count.index), "name")}"
  ip_cidr_range = lookup(element(var.subnetInfo, count.index), "ip")
  region        = var.region
  network       = google_compute_network.main-vpc.id

}



