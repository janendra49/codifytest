# resource "azurerm_resource_group" "this" {
#   name     = "example-resources"
#   location = "West Europe"
# }

resource "azurerm_app_service_plan" "this" {
  name                = "poctest-appserviceplan"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "App"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "this" {
  name                = "janendra01-app-service"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.this.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}