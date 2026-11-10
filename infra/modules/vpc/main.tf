# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  
  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "private-subnet-${count.index}"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.project_name}-ec2-sg"
  description = "SG for ec2"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH access from trusted IP"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  egress {
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-ec2-sg"
  }
}