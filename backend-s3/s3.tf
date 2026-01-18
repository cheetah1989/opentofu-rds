
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "chetan-edu-tf-state-01"
  force_destroy = true
  object_lock_enabled = true

  tags = {
    Owner       = "Chetan Pardeshi"
    Environment = "terraform-backend"
  }
  
}

resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "tf_state_bucket_public_access" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object_lock_configuration" "tf_state_bucket_object_lock" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 365
    }
  }
}
