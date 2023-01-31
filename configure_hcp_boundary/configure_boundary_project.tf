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
