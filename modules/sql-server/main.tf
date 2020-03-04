resource "azurerm_sql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_administrator_login
  administrator_login_password = var.sql_administrator_password
  tags                         = var.common_tags
}

resource "azurerm_mssql_elasticpool" "sql_server_elastic_pool" {
  name                = "${var.sql_server_name}-primary"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.sql_server.name
  max_size_bytes      = 214748364800

  sku {
    name     = "StandardPool"
    tier     = "Standard"
    capacity = 100
  }

  per_database_settings {
    min_capacity = 0
    max_capacity = 100
  }

  tags = var.common_tags
}

resource "azurerm_sql_firewall_rule" "sql_server_firewall_rule" {
  for_each = var.sql_firewall_rules

  resource_group_name = var.resource_group_name
  name                = each.value.name
  server_name         = azurerm_sql_server.sql_server.name
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
}
