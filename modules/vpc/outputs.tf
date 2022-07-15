output "vpc_id" {
  value = aws_vpc.main.id
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