resource "aws_vpc" "opentofuRDS_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Purpose = "Practice RDS VPC"
  }
}

resource "aws_subnet" "opentofuRDS_pubsubnet" {
  vpc_id     = aws_vpc.opentofuRDS_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Purpose = "opentofuRDS_public_subnet"
  }
}

resource "aws_subnet" "opentofuRDS_privsubnet1" {
  vpc_id     = aws_vpc.opentofuRDS_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Purpose = "opentofuRDS_private_subnet"
  }
}

resource "aws_subnet" "opentofuRDS_privsubnet2" {
  vpc_id     = aws_vpc.opentofuRDS_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Purpose = "opentofuRDS_private_subnet"
  }
}

