# Yandex Cloud IAM Terraform module

Terraform module which creates IAM resources on Yandex Cloud.

## Usage
```hcl
module "iam" {
  source  = ""
  version = "~> 0.0.1"

  service_accounts = {
    sa-editor = {
      description = "Service account to manage folder"
      folder_id = "f0lderId1234567"
      role = "editor"
      create_static_keys = false
    },
    sa-s3-editor = {
      description = "Service account to manage S3"
      folder_id = "f0lderId1234567"
      role = "storage.admin"
      create_static_keys = true
    },
  }
}
```
