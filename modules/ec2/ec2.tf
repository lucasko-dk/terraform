#bastion host ec2
resource "aws_instance" "md-sf-sbu-mdk-dev-ec2-bs" {
  ami                    = var.bs_ami
  instance_type          = var.bs_instance_type
  subnet_id              = var.bs_subnet_id
  //vpc_security_group_ids = var.bs_vpc_security_group_ids
//  key_name  = "BIM-KEY"

  tags = {
    "Name" : "md-sf-sbu-mdk-dev-ec2-bs"
  }
}

#cloud9 ec2
resource "aws_instance" "aws-cloud9-md-sf-sbu-mdk-dev-c9-eks-workspace-be41dbc311e54f23a511182adccf0dd2" {
  ami                    = var.c9_ami
  instance_type          = var.c9_instance_type
  subnet_id              = var.c9_subnet_id
  //vpc_security_group_ids = var.bs_vpc_security_group_ids
//  key_name  = "BIM-KEY"

  tags = {
    "Name" : "aws-cloud9-md-sf-sbu-mdk-dev-c9-eks-workspace-be41dbc311e54f23a511182adccf0dd2"
  }
}