
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

variable "network_subnetInfo" {
    description = "A map of range of IP of the subnet for the VPC"

}