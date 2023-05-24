variable "projectId" {
  description = "The ID of the Project to which the resources belong"
  type        = string
}

variable "region" {
  description = "The region to use in our porject"
  type        = string
  default     = "europe-west12"
}

variable "zone" {
  description = "The zone of the region to use"
  type        = string
  default     = "europe-west12-a"
}

variable "userId" {
  description = "The specific user creation ID"
  type        = string

}
