# Terraform Fastly Object Storage Module

This Terraform module creates Fastly Object Storage access keys and integrates with S3-compatible bucket operations.

## Prerequisites

- Terraform >= 1.0
- Fastly API key with appropriate permissions
- Fastly account with Object Storage enabled

## Usage

### Step 1: Create Fastly Access Keys

First, create the Fastly object storage access keys:

1. **Comment out the S3 module** in `main.tf`:
   ```hcl
   # module "s3" {
   #   source = "./modules/s3"
   #   
   #   secret_key_id = fastly_object_storage_access_keys.main.id
   #   secret_key    = fastly_object_storage_access_keys.main.secret_key
   # }
   ```

2. **Set your Fastly API key** in `variables.tf` by updating the default value:
   ```hcl
   variable "fastly_api_key" {
     description = "Fastly API key for authentication"
     type        = string
     sensitive   = true
     default     = "your-fastly-api-key-here"
   }
   ```

3. **Apply to create access keys**:
   ```bash
   terraform init
   terraform apply
   ```
   
   This will create the Fastly access keys and display them as outputs.

### Step 2: Create S3 Bucket

After the access keys are created:

1. **Uncomment the S3 module** in `main.tf`:
   ```hcl
   module "s3" {
     source = "./modules/s3"
     
     secret_key_id = fastly_object_storage_access_keys.main.id
     secret_key    = fastly_object_storage_access_keys.main.secret_key
   }
   ```

2. **Apply to create S3 bucket**:
   ```bash
   terraform apply
   ```

## Configuration

### Variables

- `fastly_api_key` - Your Fastly API key (can be set via environment variable `TF_VAR_fastly_api_key`)

### Outputs

- `fastly_access_key` - The access key ID for S3 operations (sensitive)
- `fastly_secret_key` - The secret key for S3 operations (sensitive)

## Example

```bash
# Update variables.tf with your Fastly API key first

# Initialize and create access keys (with S3 module commented out)
terraform init
terraform apply

# Uncomment the S3 module in main.tf
# Then apply again to create the bucket
terraform apply
```