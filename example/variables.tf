variable "token" {
  type      = string
  sensitive = true
}

variable "yc_cloud_id" {
  type      = string
  sensitive = true
}

# variable "yc_folder_id" {
#   type      = string
#   sensitive = true
# }

variable "service_accounts" {
  description = "Yandex Cloud Services Accounts map to create."
  type = map(object({
    name      = string
    role      = string
    folder_id = string
    create_static_keys = bool
  }))
}