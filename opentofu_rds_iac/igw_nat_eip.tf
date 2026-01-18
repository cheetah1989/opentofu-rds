resource "aws_internet_gateway" "opentofuRDS_igw" {
  vpc_id = aws_vpc.opentofuRDS_vpc.id

  tags = {
    Purpose = "opentofuRDS_igw"
  }
}

resource "aws_route_table" "opentofuRDS_pub_routetable" {
  vpc_id = aws_vpc.opentofuRDS_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.opentofuRDS_igw.id
  }
}


resource "aws_eip" "opentofuRDS_eip" {
  domain = "vpc"
  tags = {
    Purpose = "EIP for NAT Gateway"
  }
}

resource "aws_nat_gateway" "opentofuRDS_igw_nat" {
  allocation_id = aws_eip.opentofuRDS_eip.id
  subnet_id     = aws_subnet.opentofuRDS_pubsubnet.id

  tags = {
    Purpose = "NAT Gateway for Private Subnet"

  }
}

resource "aws_route_table" "opentofuRDS_priv_routetable" {
  vpc_id = aws_vpc.opentofuRDS_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.opentofuRDS_igw_nat.id
  }
}