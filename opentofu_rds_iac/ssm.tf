resource "aws_ssm_parameter" "opentofu_rds_password" {
  name        = "/opentofu/rds/password"
  description = "RDS instance password for opentofu"
  type        = "SecureString"
  value       = random_password.rds_password.result
}