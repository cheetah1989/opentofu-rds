# opentofu-rds
Infrastructure for RDS Creation via IaC


I have create a opentofu project to showcase IaC skills for creating Database Infra for Database Platform, following are the resources I am creating via IaC with no manaul intervention.

1. s3 for backend.
2. VPC, one private subnet and one public subnet for RDS
3. One t2 micro ec2 bastion host for accessing the RDS in private subnet. 
4. Obviously RDS instance bare minimum in free tier mysql db.
5. I will running this code from GitHub Actions

What I intended to demostrate in this repo is:
IaC lifecycle thinking
Remote state hygiene
CI-safe Terraform usage
RDS in private subnet with bastion
Free-tier realism (no fantasy architectures)
