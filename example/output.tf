output "service_accounts_id" {
  value = module.iam.service_accounts_id
  sensitive = false
}

output "service_accounts" {
  value       = module.iam.service_accounts
  sensitive = false
}

output "service_accounts_names_ids" {
  value = module.iam.service_accounts_names_ids
  sensitive = false
}

output "service_accounts_names" {
  value = module.iam.service_accounts_names
}

output "service_accounts_static_keys_encrypted" {
  value = module.iam.service_accounts_static_keys_encrypted
}

output "service_accounts_static_keys_non_encrypted" {
  value = module.iam.service_accounts_static_keys_non_encrypted
  sensitive = true
}