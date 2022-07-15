variable "bs_ami" {
  type = string
}
variable "bs_instance_type" {
  type = string
}

variable "bs_subnet_id" {
  description = "Subnet id"
  type = string
}

variable "c9_ami" {
  type = string
}
variable "c9_instance_type" {
  type = string
}

variable "c9_subnet_id" {
  description = "Subnet id"
  type = string
}
/*
variable "bs_vpc_security_group_ids" {
  description = "Security group ids"
  type = string
}
*/
