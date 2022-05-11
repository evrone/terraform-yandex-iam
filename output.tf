output "service_accounts_id" {
  value = [
    for service_account in yandex_iam_service_account.service_accounts : service_account.id
  ]
}

output "service_accounts" {
  value = [
    for service_account in yandex_iam_service_account.service_accounts : service_account
  ]
}

output "service_accounts_names_ids" {
  value = {
    for k, v in yandex_iam_service_account.service_accounts : k => v.id
  }
}

output "service_accounts_names" {
  value = [
    for key, value in yandex_iam_service_account.service_accounts: key
  ]
}

output "service_accounts_static_keys_encrypted" {
  value = {
    for k, v in yandex_iam_service_account_static_access_key.sa-static-key : k => v.encrypted_secret_key
  }
}

output "service_accounts_static_keys_non_encrypted" {
  value = {
    for k, v in yandex_iam_service_account_static_access_key.sa-static-key : k => v.secret_key
  }
}

output "test" {
  value = var.service_accounts
}