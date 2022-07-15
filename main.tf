terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.27.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "./modules/vpc"
  /*
  vpc_id         = "unknown"
  vpc_cidr_block = "10.1.0.0/16"

  # VPC가 사용할 AZ를 정의한다.
  availability_zone = ["ap-northeast-2a", "ap-northeast-2c"]
  # VPC의 Public Subnet CIDR block을 정의한다.
  public_subnet_cidr_block = ["10.1.0.0/20", "10.1.16.0/20"]
  # VPC의 Private Subnet CIDR block을 정의한다.
  private_subnet_cidr_block = ["10.1.128.0/20", "10.1.144.0/20"]
  */
  vpc_id                    = var.vpc_id
  vpc_cidr_block            = var.vpc_cidr_block
  availability_zone         = var.availability_zone
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  bs_security_group = var.bs_security_group

}

module "ec2" {
  source = "./modules/ec2"
  #bastion host ec2 
  bs_ami           = var.bs_ami
  bs_instance_type = var.bs_instance_type
  bs_subnet_id     = var.bs_subnet_id

  #cloud9 ec2 
  c9_ami           = var.c9_ami
  c9_instance_type = var.c9_instance_type
  c9_subnet_id     = var.c9_subnet_id
  //bs_vpc_security_group_ids = var.bs_vpc_security_group_ids
}