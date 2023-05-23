 
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}



resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}


resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}


resource "azurerm_windows_function_app" "example" {
  name                      = "example-windows-function-app"
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  app_service_plan_id       = azurerm_app_service_plan.example.id
  storage_account_name      = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
}


resource "azurerm_function_app_function" "example" {
  name                      = var.function_name
  resource_group_name       = azurerm_resource_group.example.name
  function_app_name         = azurerm_windows_function_app.example.name
  storage_account_name      = azurerm_storage_account.example.name
  app_service_plan_id       = azurerm_app_service_plan.example.id
  storage_connection_string = azurerm_storage_account.example.primary_connection_string
}

