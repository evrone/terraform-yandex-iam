resource "yandex_iam_service_account" "service_accounts" {
  for_each = var.service_accounts

  name = each.value["name"]
  folder_id = each.value["folder_id"]
}

resource "yandex_resourcemanager_folder_iam_binding" "admin-account-iam" {
  for_each = var.service_accounts

  role = each.value["role"]
  folder_id = each.value["folder_id"]
  members = [
    "serviceAccount:${yandex_iam_service_account.service_accounts[each.key].id}",
  ]

  depends_on = [
    yandex_iam_service_account.service_accounts
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  for_each = {
    for key, value in var.service_accounts:
      key => value
      if value.create_static_keys != false
 }

  service_account_id = "${yandex_iam_service_account.service_accounts[each.key].id}"
  description        = "static access key for object storage"

  pgp_key = var.pgp_key
  
  depends_on = [
    yandex_iam_service_account.service_accounts,
    yandex_resourcemanager_folder_iam_binding.admin-account-iam
  ]

  lifecycle {
    create_before_destroy = true
  }
}