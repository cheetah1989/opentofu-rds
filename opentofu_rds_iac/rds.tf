resource "aws_db_instance" "opentofuRDS" {
  allocated_storage    = 10
  db_name              = "opentofurdsdb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.rds_mysql_instance_type
  db_subnet_group_name = aws_db_subnet_group.opentofuRDS_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.opentofuRDS_sg.id]
  username             = "mysqladmin"
  password             = aws_ssm_parameter.opentofu_rds_password.value
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  deletion_protection = false
  depends_on = [ 
    aws_ssm_parameter.opentofu_rds_password,
    aws_db_subnet_group.opentofuRDS_db_subnet_group,
    aws_vpc.opentofuRDS_vpc,
    aws_subnet.opentofuRDS_privsubnet,
    aws_security_group.opentofuRDS_bastion_sg
    ]
}

resource "random_password" "rds_password" {
  length           = 16
  special          = true
  override_special = "!@#$()"
}

resource "aws_db_subnet_group" "opentofuRDS_db_subnet_group" {
  name       = "opentofu_rds_db_subnet_group"
  subnet_ids = [
          aws_subnet.opentofuRDS_privsubnet1.id,
          aws_subnet.opentofuRDS_privsubnet2.id
        ]

  tags = {
    Purpose = "Subnet group for RDS instance"
  }
}

resource "aws_security_group" "opentofuRDS_sg" {
  name        = "opentofu_rds_sg"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.opentofuRDS_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
    description = "Allow MySQL access from private subnet"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.1.0/24"]
    description = "Allow all outbound traffic to private subnet"
  }
  tags = {
    Purpose = "Security group for RDS instance"
  }
}
