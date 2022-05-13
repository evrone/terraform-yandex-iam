output "service_accounts_id" {
  value = [
    for service_account in yandex_iam_service_account.service_accounts : service_account.id
  ]
  description = "Service accounts id key => value list"
}

output "service_accounts" {
  value = [
    for service_account in yandex_iam_service_account.service_accounts : service_account
  ]
  description = "Service accounts raw list"
}

output "service_accounts_names_ids" {
  value = {
    for k, v in yandex_iam_service_account.service_accounts : k => v.id
  }
  description = "Service accounts id list"
}

output "service_accounts_names" {
  value = [
    for key, value in yandex_iam_service_account.service_accounts : key
  ]
  description = "Service accounts name list"
}

output "service_accounts_static_keys_encrypted" {
  value = {
    for k, v in yandex_iam_service_account_static_access_key.sa-static-key : k => v.encrypted_secret_key
  }
  description = "Service accounts static keys list"
}

output "service_accounts_static_keys_non_encrypted" {
  value = {
    for k, v in yandex_iam_service_account_static_access_key.sa-static-key : k => v.secret_key
  }
  description = "Service accounts static keys list (encrypted)"
}