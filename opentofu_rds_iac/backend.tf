terraform {
  backend "s3" {
    bucket  = "chetan-edu-tf-state-01"
    key     = "opentofuRDS.tfstate" # Logical path within the bucket
    region  = "ap-south-1"
    encrypt = true
    # Use S3 native locking:
    use_lockfile = true
  }
}

