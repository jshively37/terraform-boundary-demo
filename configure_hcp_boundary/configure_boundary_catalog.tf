resource "boundary_host_catalog_static" "catalog" {
  name        = var.boundary_catalog_name
  description = var.boundary_catalog_desc
  scope_id    = boundary_scope.project.id
}
