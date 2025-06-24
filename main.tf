terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = "~> 7.1.0"
    }
  }
}

provider "fastly" {
  api_key = var.fastly_api_key
}

resource "fastly_object_storage_access_keys" "main" {
  description = "Access keys for S3 integration"
  permission  = "read-write-objects"
}

module "s3" {
  source = "./modules/s3"
  
  secret_key_id = fastly_object_storage_access_keys.main.access_key_id
  secret_key    = fastly_object_storage_access_keys.main.secret_key
}
