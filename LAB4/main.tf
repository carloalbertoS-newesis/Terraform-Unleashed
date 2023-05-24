locals {
  vpc = {
    management = {
      network_name             = "${var.projectId}-vpc-mgmt-1"
      subnetwork_name          = "${var.projectId}-mgmt-subnet-01"
      subnetwork_ip_cidr_range = "10.10.10.0/24"
    },
    inside = {
      network_name             = "${var.projectId}-vpc-inside-1"
      subnetwork_name          = "${var.projectId}-inside-subnet-01"
      subnetwork_ip_cidr_range = "10.10.20.0/24"
    },
    outside = {
      network_name             = "${var.projectId}-vpc-outside-1"
      subnetwork_name          = "${var.projectId}-outside-subnet-01"
      subnetwork_ip_cidr_range = "10.10.30.0/24"
    }
  }
}


/******************************************
	VPC configuration
 *****************************************/

module "vpc_management" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = var.projectId
  network_name = local.vpc.management.network_name

  subnets = [
    {
      subnet_name   = local.vpc.management.subnetwork_name
      subnet_ip     = local.vpc.management.subnetwork_ip_cidr_range
      subnet_region = var.region
    }
  ]
}

module "vpc_inside" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = var.projectId
  network_name = local.vpc.inside.network_name

  subnets = [
    {
      subnet_name   = local.vpc.inside.subnetwork_name
      subnet_ip     = local.vpc.inside.subnetwork_ip_cidr_range
      subnet_region = var.region
    }
  ]
}

module "vpc_outside" {
  source  = "terraform-google-modules/network/google"
  version = "~> 3.0"

  project_id   = var.projectId
  network_name = local.vpc.outside.network_name

  subnets = [
    {
      subnet_name   = local.vpc.outside.subnetwork_name
      subnet_ip     = local.vpc.outside.subnetwork_ip_cidr_range
      subnet_region = var.region
    }
  ]
}

/******************************************
	ASAv Instance
 *****************************************/

module "ciscoasav" {
  source  = "gehoumi/ciscoasav-vm/google"
  version = "1.0.8"
  name           = "${var.projectId}-${var.userId}-cisco-asav-1"
  project_id     = var.projectId
  project_number = var.projectNumber

  mgmt_network         = local.vpc.management.network_name
  mgmt_subnetwork      = local.vpc.management.subnetwork_name
  mgmt_subnetwork_cidr = local.vpc.management.subnetwork_ip_cidr_range

  inside_network         = local.vpc.inside.network_name
  inside_subnetwork      = local.vpc.inside.subnetwork_name
  inside_subnetwork_cidr = local.vpc.inside.subnetwork_ip_cidr_range

  outside_network         = local.vpc.outside.network_name
  outside_subnetwork      = local.vpc.outside.subnetwork_name
  outside_subnetwork_cidr = local.vpc.outside.subnetwork_ip_cidr_range

  depends_on = [
    module.vpc_management,
    module.vpc_inside,
    module.vpc_outside,
  ]
}