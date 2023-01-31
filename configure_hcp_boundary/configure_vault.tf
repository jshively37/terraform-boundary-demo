resource "vault_database_secrets_mount" "postgres" {
  path                      = "db"
  description               = "Postgres Database"
  default_lease_ttl_seconds = 3600  # Default to 1 hour
  max_lease_ttl_seconds     = 14400 # Renewable up to 4 hours

  postgresql {
    name           = "postgres"
    username       = var.db_username
    password       = var.db_password
    connection_url = "postgresql://{{username}}:{{password}}@${var.db_addr}/postgres?sslmode=disable"
    allowed_roles = [
      "readonly"
    ]
  }
}

resource "vault_database_secret_backend_role" "postgres" {
  name    = "readonly"
  backend = vault_database_secrets_mount.postgres.path
  db_name = vault_database_secrets_mount.postgres.postgresql[0].name
  creation_statements = [
    "CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}';",
    "GRANT SELECT ON ALL TABLES IN SCHEMA public TO \"{{name}}\";",
  ]
}
