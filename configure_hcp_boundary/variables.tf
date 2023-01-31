variable "boundary_addr" {
  type        = string
  description = "URL for Boundary"
}

variable "boundary_auth_method_id" {
  type        = string
  description = "ID of the auth method in Boundary"
}

variable "boundary_username" {
  type        = string
  description = "Boundary username"
}

variable "boundary_password" {
  type        = string
  description = "Boundary password"
}

variable "boundary_org_name" {
  type        = string
  description = "Name of the Boundary organization"
}

variable "boundary_org_description" {
  type        = string
  description = "Description for the Boundary organization"
}

variable "boundary_project_name" {
  type        = string
  description = "Name of the Boundary project"
}

variable "boundary_project_description" {
  type        = string
  description = "Description for the Boundary project"
}

variable "boundary_scope" {
  type        = string
  description = "Boundary scope to use"
}

variable "vault_store_name" {
  type        = string
  description = "Vault credential store name"
}

variable "vault_store_description" {
  type        = string
  description = "Vault crediential store description"
}

variable "vault_address" {
  type        = string
  description = "URL for Vault"
}

variable "vault_namespace" {
  type        = string
  description = "Vault namespace to use"
}

variable "vault_token" {
  type        = string
  description = "Vault token"
}

variable "db_addr" {
  type        = string
  description = "IP/FQDN of DB Server"
}

variable "db_username" {
  type        = string
  description = "DB username"
}

variable "db_password" {
  type        = string
  description = "DB password"
}
