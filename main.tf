module "sql-server" {
  source                     = "./modules/sql-server"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  common_tags                = local.common_tags
  sql_server_name            = var.sql_server_name
  sql_administrator_login    = var.sql_administrator_login
  sql_administrator_password = var.sql_administrator_password
  sql_firewall_rules         = var.sql_firewall_rules
}

module "storage-account" {
  source                   = "./modules/storage-account"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  common_tags              = local.common_tags
  storage_account_name     = var.storage_account_name
  account_tier             = var.storage_account_account_tier
  account_replication_type = var.storage_account_account_replication_type
}
