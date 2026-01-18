variable "rds_mysql_instance_type" {
  description = "MySQL Engine Version"
  default = "db.t3.micro"
}

variable "ec2_bastion_instance_type" {
  description = "EC2 shape"
  default = "t2.micro"
}