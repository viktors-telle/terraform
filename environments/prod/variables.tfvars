azure_subscription_id = ""

azure_client_id = ""

azure_tenant_id = ""

resource_group_name = ""

tags_environment = "Production"

storage_account_name = "storageprod"

sql_server_name = "sql-server-prod"

sql_administrator_login = "#{sql-server-administrator-login}"

sql_administrator_password = "#{sql-server-administrator-password}"

sql_firewall_rules = {
  azure-services = {
    name             = "azure-services"
    start_ip_address = "0.0.0.0"
    end_ip_address   = "0.0.0.0"
  }
}
