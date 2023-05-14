terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "procurveit"
    workspaces {
      name = "codifytest"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.55"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "this" {
  name     = "demotest"
  location = var.location
  lifecycle {
    prevent_destroy = false
  }
}

# # -----------------
# # App Service Plan
# # -----------------

# # resource "azurerm_app_service_plan" "bts_backend_asp" {
# #   name                = "bts-${var.env}-backend-serviceplan"
# #   location            = azurerm_resource_group.this.location
# #   resource_group_name = azurerm_resource_group.this.name
# #   kind                = "App" 
# #   sku {
# #     tier = var.bts_backend_asp_tier[var.env]
# #     size = var.bts_backend_asp_sku[var.env]
# #   }
# # }

# # resource "azurerm_app_service" "this" {
# #   name                = "bts-${var.env}-app"
# #   location            = azurerm_resource_group.this.location
# #   resource_group_name = azurerm_resource_group.this.name
# #   app_service_plan_id = azurerm_app_service_plan.bts_backend_asp.id

# #   app_settings = {
# #     "WEBSITE_DNS_SERVER" = "168.63.129.16"
# #     "WEBSITE_VNET_ROUTE_ALL" = "1"
# #   }
# # }

# # resource "azurerm_app_service_virtual_network_swift_connection" "this" {
# #   app_service_id = azurerm_app_service.this.id
# #   subnet_id      = azurerm_subnet.web_subnet.id
# # }

##