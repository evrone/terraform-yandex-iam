variable "service_accounts" {
  type = map(object({
    role      = string
    folder_id = string
    create_static_keys = bool
    description = string
  }))
}

variable "pgp_key" {
    type = string
    description = "(Optional) An optional PGP key to encrypt the resulting secret key material. May either be a base64-encoded public key or a keybase username in the form keybase:keybaseusername."
    default = null
}