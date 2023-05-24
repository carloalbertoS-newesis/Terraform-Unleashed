variable "network_name" {
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035"
  type        = string
}

variable "network_createSubnet" {
  description = "(Optional) When set to true, the network is created in \"auto subnet mode\" and it will create a subnet for each region automatically across the 10.128.0.0/9 address range."
  type        = bool
  default = false
}

variable "network_mtu" {
  description = "(Optional) Maximum Transmission Unit in bytes. The default value is 1460 bytes. The minimum value for this field is 1300 and the maximum value is 8896 bytes (jumbo frames)"
  type        = number
  default = 1640
}

variable "network_subnetName" {
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035"
  type        = string
}

variable "network_subnetIpCidrRange" {
  description = "(Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork"
  type        = string
}

variable "network_subnetName2" {
  description = "(Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035"
  type        = string
}

variable "network_subnetIpCidrRange2" {
  description = "(Required) The range of internal addresses that are owned by this subnetwork. Provide this property when you create the subnetwork"
  type        = string
}

variable "network_subnetInfo" {
    description = "A map of range of IP of the subnet for the VPC"

}