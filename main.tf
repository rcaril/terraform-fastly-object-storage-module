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
  description = "New Keys"
  permission  = "read-write-admin"
}

# module "s3" {
#   source = "./modules/s3"
#   
#   secret_key_id = fastly_object_storage_access_keys.main.id
#   secret_key    = fastly_object_storage_access_keys.main.secret_key
# }


output "fastly_access_key" {
  value = fastly_object_storage_access_keys.main.id
  sensitive = true
}

output "fastly_secret_key" {
  value = fastly_object_storage_access_keys.main.secret_key
  sensitive = true
}
