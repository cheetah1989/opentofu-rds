output "rds_password" {
  value = random_password.rds_password.result
  sensitive = true
}

output "rds_endpoint" {
  value = aws_db_instance.opentofuRDS.endpoint
}

output "ec2_bastion_public_ip" {
  value = aws_instance.opentofu_bastion.public_ip
}