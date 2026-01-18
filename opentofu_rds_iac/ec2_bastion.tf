resource "aws_instance" "opentofu_bastion" {
  ami                         = "ami-0ced6a024bb18ff2e" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type               = var.ec2_bastion_instance_type
  subnet_id                   = aws_subnet.opentofuRDS_pubsubnet.id
  vpc_security_group_ids      = [aws_security_group.opentofuRDS_bastion_sg.id]
  key_name                    = "opentofu-rds-bastion"

  tags = {
    Name    = "opentofu_bastion"
    Purpose = "Bastion Host for RDS Access"
  }
  depends_on = [ 
    aws_db_instance.opentofuRDS,
    aws_internet_gateway.opentofuRDS_igw,
    aws_nat_gateway.opentofuRDS_igw_nat,
    aws_route_table.opentofuRDS_pub_routetable,
    aws_route_table.opentofuRDS_priv_routetable,
    aws_eip.opentofuRDS_eip
    ]

}

resource "aws_security_group" "opentofuRDS_bastion_sg" {
  name        = "opentofuRDS_bastion_sg"
  description = "Security group for Bastion Host"
  vpc_id      = aws_vpc.opentofuRDS_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access from anywhere"
  } 
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
    tags = {
        Purpose = "Security group for Bastion Host"
    }
}