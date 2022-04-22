provider "yandex" {
  token     = ""
  zone      = "ru-central1-a"
}

data "local_file" "pgp_key" {
  filename = "/tmp/public-key-binary.gpg"
}

################################################################################
# Yandex Cloud IAM Module
################################################################################

module "iam" {
  source = "../"

  service_accounts = {
    manager = {
      name = "first"
      role = "viewer"
      folder_id = "b1ghrtqogtuu62mb1nr2"
      create_static_keys = true
    },
    admin = {
      name = "second"
      role = "editor"
      folder_id = "b1ghrtqogtuu62mb1nr2"
      create_static_keys = true
    }
  }

  pgp_key = data.local_file.pgp_key.content_base64

}