resource "boundary_credential_store_vault" "vault" {
  name        = var.vault_store_name
  description = var.vault_store_description
  address     = var.vault_address
  namespace   = var.vault_namespace
  token       = var.vault_token
  scope_id    = boundary_scope.project.id
}

resource "boundary_credential_library_vault" "cred_library" {
  name                = var.boundary_cred_lib_name
  description         = var.boundary_cred_lib_desc
  credential_store_id = boundary_credential_store_vault.vault.id
  path                = var.vault_path
  http_method         = "GET"
}
