# terraform
Plan: 17 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + bs_ami                 = "ami-0fd0765afb77bcca7"
  + bs_instance_type       = "t2.micro"
  + bs_security_group      = "md-sf-sbu-mdk-dev-ec2-bs-mng-sg"
  + bs_subnet_id           = "10.1.0.0/20"
  + c9_ami                 = "ami-0d69aeff4c6bc9499"
  + c9_instance_type       = "t3.small"
  + c9_subnet_id           = "10.1.0.0/20"
  + ec2                    = "==============================="
  + private_subnet_cidr_2a = "10.1.128.0/20"
  + private_subnet_cidr_2c = "10.1.144.0/20"
  + public_subnet_cidr_2a  = "10.1.0.0/20"
  + public_subnet_cidr_2c  = "10.1.16.0/20"
  + vpc                    = "==============================="
  + vpc_cidr_block         = "10.1.0.0/16"
  + vpc_id                 = "unknown"


if new services scripts will be added like eks/dynamodb, additioanl source folder should be created in modules folder (refer to ec2,vpc)
