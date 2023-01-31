terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "1.1.3"
    }
  }
}

provider "boundary" {
  addr                            = var.boundary_addr
  auth_method_id                  = var.boundary_auth_method_id
  password_auth_method_login_name = var.boundary_username
  password_auth_method_password   = var.boundary_password
}
