resource "boundary_scope" "org" {
  name                     = var.boundary_org_name
  description              = var.boundary_org_description
  scope_id                 = var.boundary_scope
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "boundary_scope" "project" {
  name                   = var.boundary_project_name
  description            = var.boundary_project_description
  scope_id               = boundary_scope.org.id
  auto_create_admin_role = true
}

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
