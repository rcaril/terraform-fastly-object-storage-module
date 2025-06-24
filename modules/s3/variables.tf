variable "secret_key_id" {
  description = "The access key ID for S3 authentication"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "The secret access key for S3 authentication"
  type        = string
  sensitive   = true
}