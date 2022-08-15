provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATMFNDBSY6FGL6PFN"
  secret_key = "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"
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-test-s3-terraform-bucket1989"
  acl    = "private"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "my-test-s3-terraform-bucket"
  }

}

resource "aws_s3_bucket_public_access_block" "private_bucket" {
  bucket = "my-test-s3-terraform-bucket1989"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

