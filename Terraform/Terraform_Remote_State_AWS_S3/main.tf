provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "learning-terraform-state-12262021"

  # Preventing accidental deletion    
  lifecycle {
    prevent_destroy = true
  }

  # Enabling Versioning
  versioning {
    enabled = true
  }

  # Enabling server side encryption by default

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "learning-terraform-state-12262021-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "learning-terraform-state-12262021"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-south-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "learning-terraform-state-12262021-locks"
    encrypt        = true
  }
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}