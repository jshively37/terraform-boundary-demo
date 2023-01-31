resource "boundary_host_static" "host" {
  name            = var.boundary_static_host_name
  description     = var.boundary_static_host_desc
  address         = var.boundary_static_host_addr
  host_catalog_id = boundary_host_catalog_static.catalog.id
}

resource "boundary_host_set_static" "host" {
  name            = var.boundary_host_set_name
  host_catalog_id = boundary_host_catalog_static.catalog.id
  host_ids = [
    boundary_host_static.host.id,
  ]
}

resource "boundary_target" "host" {
  name         = var.boundary_target_host_name
  description  = var.boundary_target_host_desc
  type         = "tcp"
  default_port = var.boundary_target_host_port
  scope_id     = boundary_scope.project.id
  host_source_ids = [
    boundary_host_set_static.host.id
  ]
  brokered_credential_source_ids = [
    boundary_credential_library_vault.cred_library.id
  ]
}
