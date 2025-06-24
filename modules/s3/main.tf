terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.0"
    }
  }
}

provider "aws" {
  access_key = var.secret_key_id != "" ? var.secret_key_id : "dummy-access-key"
  secret_key = var.secret_key != "" ? var.secret_key : "dummy-secret-key"
  region     = "us-east"

  s3_use_path_style                  = true
  skip_credentials_validation        = true
  skip_metadata_api_check            = true
  skip_region_validation             = true
  skip_requesting_account_id         = true

  endpoints {
    s3 = "https://us-east.object.fastlystorage.app"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = "my-test-bucket-123"
  
  # Fastly object storage uses different region names
  lifecycle {
    ignore_changes = [region]
  }
}