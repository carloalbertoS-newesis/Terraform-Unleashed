
module "network" {
  # Module reference via path
  source = "../modules/google_compute_network"
  # values for module variables
  region        = var.region
    projectId = var.projectId
    userId = var.userId
    auto_create_subnetworks = var.network_createSubnet
    mtu                     = var.network_mtu
    network_subnetInfo = var.network_subnetInfo

}
