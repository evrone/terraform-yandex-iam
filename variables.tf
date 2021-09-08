variable "service_accounts" {
  description = "A map of Yandex Cloud Service Accounts to create."
  type = map(object({
    description        = string
    folder_id          = string
    role               = string
    create_static_keys = bool
  }))
  default = {}
}

variable "keys_encyption_pgp_key" {
  type        = string
  description = "(Optional) An optional PGP key to encrypt the resulting secret key material. May either be a base64-encoded public key or a keybase username in the form keybase:keybaseusername."
  default     = null
}
