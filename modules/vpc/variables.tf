variable "vpc_id" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}

variable "public_subnet_cidr_block" {
  description = "Public Subnet cidr block"
  type        = list(any)
}

variable "private_subnet_cidr_block" {
  description = "Private Subnet cidr block"
  type        = list(any)
}

variable "availability_zone" {
  description = "Seoul region availability zone"
  type        = list(any)
}

variable "bs_security_group" {
  description = "Security group for bs ec2"
  type        = string
}

