#vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

#subnet (public,private)
resource "aws_subnet" "public" {
  count             = length(var.availability_zone)
  availability_zone = element(var.availability_zone, count.index)
  //vpc_id = "${aws_vpc.default.id}"
  vpc_id = var.vpc_id
  //cidr_block = "${cidrsubnet(var.vpc_cidr_block, 4, count.index)}"
  cidr_block = element(var.public_subnet_cidr_block, count.index)

  tags = {
    "Name" : "Public Subnet - ${element(var.availability_zone, count.index)}"
  }
}

resource "aws_subnet" "private" {
  count             = length(var.availability_zone)
  availability_zone = element(var.availability_zone, count.index)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.private_subnet_cidr_block, count.index)
  tags = {
    "Name" : "Private Subnet - ${element(var.availability_zone, count.index)}"
  }
}

#igw,nat,eip
resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id
}

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public.*.id, 0)
  depends_on    = [aws_internet_gateway.gw]
}

#route table (public,private)
resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    "Name" : "Public Subnet Route Table"
  }

}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    "Name" : "Private Subnet Route Table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.availability_zone)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

#security-group for bs ec2 - md-sf-sbu-mdk-dev-ec2-bs-mng-sg
resource "aws_security_group" "md-sf-sbu-mdk-dev-ec2-bs-mng-sg" {
  vpc_id      = var.vpc_id                        #생성할 위치의 VPC ID
  //name        = "md-sf-sbu-mdk-dev-ec2-bs-mng-sg" #그룹 이름
  name = var.bs_security_group
  description = "md-sf-sbu-mdk-dev-ec2-bs-mng-sg" #설명
  ingress {
    from_port   = 0                #아웃바운드 시작 포트
    to_port     = 0                #아웃바운드 끝나는 포트
    protocol    = "-1"             #사용할 프로토콜
    description = "all"            #설명
    cidr_blocks = ["172.20.56.0/24"] #허용할 IP 범위
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "SSH"
    cidr_blocks = ["203.242.62.1/32"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "all"
    cidr_blocks = ["172.20.68.0/24"]
  }

  egress {
    from_port   = 0           #아웃바운드 시작 포트
    to_port     = 0           #아웃바운드 끝나는 포트
    protocol    = "-1"        #사용할 프로토콜
    description = "all"       #설명
    cidr_blocks = ["0.0.0.0/0"] #허용할 IP 범위
  }
}


/*
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_block
}
*/

/*
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block
}


resource "aws_internet_gateway" "main" {
  vpc_id = var.vpc_id
}

resource "aws_eip" "nat" {
  vpc = true
}


resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
}


resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
*/