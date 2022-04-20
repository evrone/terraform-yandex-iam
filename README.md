# Yandex Cloud IAM Terraform module

Terraform module which creates IAM resources on Yandex Cloud.

## Usage
```hcl
module "iam" {
  source  = ""
  version = "~> 0.0.1"

  service_accounts = {
    folder-editor = {
      description = "Service account to manage folder"
      folder_id = "folderId"
      role = "editor"
      create_static_keys = false
    },
    s3-editor = {
      description = "Service account to manage S3"
      folder_id = "folderId"
      role = "storage.admin"
      create_static_keys = true
    }
  }
}
```
