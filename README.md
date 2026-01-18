# opentofu-rds
Infrastructure for RDS Creation via IaC


I have create a opentofu project to showcase IaC skills for creating Database Infra for Database Platform, following are the resources I am creating via IaC with no manaul intervention.

1. s3 for backend.
2. VPC, one private subnet and one public subnet for RDS
3. One t2 micro ec2 bastion host for accessing the RDS in private subnet. 
4. Obviously RDS instance bare minimum in free tier mysql db.
5. I will running this code from GitHub Actions

What I intended to demostrate in this repo is:
1. IaC lifecycle thinking
2. Remote state hygiene
3. CI-safe Terraform usage
4. RDS in private subnet with bastion
5. Free-tier realism (no fantasy architectures)
