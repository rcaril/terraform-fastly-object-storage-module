output "debug_access_key" {
  value = var.secret_key_id
  sensitive = true
}

output "debug_secret_key" {
  value = var.secret_key
  sensitive = true
}

output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.main.bucket
}

output "bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.main.arn
}