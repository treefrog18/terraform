provider "aws" {
    region = "ap-northeast-2"
  
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = "terraform-up-and-running-state-945872"

    lifecycle {
        prevent_destroy = true
    }

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
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = "terrraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }
}

terraform {
  backend "s3" {
    key = "global/s3/terraform.tfstate"  
  }
}
