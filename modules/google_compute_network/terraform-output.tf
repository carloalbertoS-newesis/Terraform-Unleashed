
output "vnet_name" {
  value = google_compute_network.main-vpc.name
}

output "subnet0_name" {
  value = google_compute_subnetwork.regional-subnetworks.0.name
}

output "subnet01_name" {
  value = google_compute_subnetwork.regional-subnetworks.1.name
}