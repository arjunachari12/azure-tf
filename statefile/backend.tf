terraform {
  backend "azurerm" {
    resource_group_name = "arjunRG"
    storage_account_name = "storageforterraf1212"
    container_name = "tfsstate"
    key = "terraform.tfstate"
    
  }
}