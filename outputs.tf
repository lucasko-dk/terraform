#vpc
output "vpc" {
  value = "==============================="
}

output "vpc_id" {
  //value = module.vpc.vpc_id
  value = var.vpc_id
}

output "vpc_cidr_block" {
  value = var.vpc_cidr_block
}

output "public_subnet_cidr_2a" {
  value = element(var.public_subnet_cidr_block, 0)
}

output "public_subnet_cidr_2c" {
  value = element(var.public_subnet_cidr_block, 1)
}

output "private_subnet_cidr_2a" {
  value = element(var.private_subnet_cidr_block, 0)
}

output "private_subnet_cidr_2c" {
  value = element(var.private_subnet_cidr_block, 1)
}

output "bs_security_group" {
  value = var.bs_security_group
}


#ec2
output "ec2" {
  value = "==============================="
}

output "bs_ami" {
  value = var.bs_ami
  //value = module.ec2.bs_ami
}

output "bs_instance_type" {
  value = var.bs_instance_type
  //value = module.ec2.bs_instance_type

}

output "bs_subnet_id" {
  value = var.bs_subnet_id
}

output "c9_ami" {
  value = var.c9_ami
}

output "c9_instance_type" {
  value = var.c9_instance_type
}

output "c9_subnet_id" {
  value = var.c9_subnet_id
}

/*
output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}
*/




