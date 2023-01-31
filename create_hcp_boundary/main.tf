resource "hcp_boundary_cluster" "create_cluster" {
  cluster_id = var.cluster_name
  username   = var.username
  password   = var.password
}
