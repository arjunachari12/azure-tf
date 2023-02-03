terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 0.1.2"
}

provider "azurerm" {
  features {
  }
}

data "azurerm_resource_group" "example" {
 name = "RGcreatedmannualy"
}

resource "azurerm_resource_group" "rg" {
  name     = data.azurerm_resource_group.example.name
  location = data.azurerm_resource_group.example.location
  tags = {
    "owner" = "arjun"
    "env" = "dev"
  }
}

output "id" {
    value = data.azurerm_resource_group.example.id
}