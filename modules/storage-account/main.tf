resource "azurerm_storage_account" "storage_account" {
  name                      = var.storage_account_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  account_kind              = "StorageV2"
  access_tier               = "Hot"
  enable_https_traffic_only = "true"
  tags                      = var.common_tags
}

resource "azurerm_advanced_threat_protection" "storage_account_threat_protection" {
  target_resource_id = azurerm_storage_account.storage_account.id
  enabled            = true
}
