terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.1.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rgtest"
  location = "centralindia"
  tags = {
    "owner" = "arjun"
    "env" = "dev"
  }
}

