variable "resource_group_name" {}

variable "location" {
  default = "West Europe"
}

variable "tags_environment" {
  default = "Development"
}

variable "azure_subscription_id" {}

variable "azure_client_id" {}

variable "azure_client_secret" {}

variable "azure_tenant_id" {}

variable "storage_account_name" {
  default = "storagedev"
}

variable "storage_account_account_tier" {
  default = "Standard"
}

variable "storage_account_account_replication_type" {
  default = "LRS"
}

variable "sql_server_name" {
  default = "sql-server-dev"
}

variable "sql_administrator_login" {}

variable "sql_administrator_password" {}

variable "sql_firewall_rules" {}

locals {
  common_tags = {
    Environment = var.tags_environment
  }
}
