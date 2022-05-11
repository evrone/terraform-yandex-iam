# Yandex Cloud IAM Terraform module

Terraform module which creates IAM resources on Yandex Cloud.

## Usage

You can find full example of module usage in folder example/

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

### Encryption with GPG
There is posibility to encrypt output static keys of service accounts with GPG keys. For encryption there is need to:
1. Create key, f.e. `gpg --gen-key`
2. Export key in binary format `gpg --output public-key-binary.gpg --export test@test.ru` and use the local terraform provider to read the base64-encoded content of the file.
3. write path of the exported key in `data "local_file" "pgp_key"`
4. Run `tf apply` and get output for `service_accounts_static_keys_encrypted`
5. Export env variable for correct decrypt via gpg `export GPG_TTY=$(tty)`
6. Decrypt:
`echo -e "wcDMA/Xr4VdCf3d6AQwABEJLZmeErwifMsu2N34k/v1d77yZr9fbZTsir/++//mY8cK4gIJ7HvhIQIA" | base64 -d | gpg --decrypt`
7. Here we are!

Also there is no nessesary to use GPG and encryption - even if `pgp_key` varibale will be without any value (null) or just commented in example/main.tf, terraform will create plain text static_keys