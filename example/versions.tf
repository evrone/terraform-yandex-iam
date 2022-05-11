terraform {
  required_providers {
    yandex = {
      source = "terraform-registry.storage.yandexcloud.net/yandex-cloud/yandex"
      version = ">= 0.65"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.2.0"
    }
  }
  required_version = ">= 0.13"
}