# resource "azurerm_sql_server" "primary" {
#     name = var.primary_database
#     resource_group_name = var.resource_group
#     location = var.location
#     version = var.primary_database_version
#     administrator_login = var.primary_database_admin
#     administrator_login_password = var.primary_database_password
# }

# resource "azurerm_sql_database" "db" {
#   name                = "db"
#   resource_group_name = var.resource_group
#   location            = var.location
#   server_name         = azurerm_sql_server.primary.name
# }


resource "azurerm_mssql_server" "primary" {
   name                         = "testdb"
  resource_group_name          = var.resource_group
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.primary_database_admin
  administrator_login_password = var.primary_database_password
  minimum_tls_version          = "1.2"
  
}

resource "azurerm_mssql_database" "db" {
  name = "mydb"
  # resource_group_name = var.resource_group
  # location = var.location
  #server_name = azurerm_mssql_server.primary.name
  server_id = azurerm_mssql_server.primary.id
}