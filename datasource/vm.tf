provider "azurerm" {
  version = "2.35.0"
}

data "azurerm_resource_group" "example" {
  name = "example-group"
}

data "azurerm_virtual_machine" "example" {
  name                = "example-vm"
  resource_group_name = data.azurerm_resource_group.example.name
}

resource "azurerm_virtual_machine" "example" {
  name                  = data.azurerm_virtual_machine.example.name
  location              = data.azurerm_resource_group.example.location
  resource_group_name   = data.azurerm_resource_group.example.name
  network_interface_ids = data.azurerm_virtual_machine.example.network_interface_ids
  vm_size               = data.azurerm_virtual_machine.example.hardware_profile.vm_size

  storage_image_reference {
    publisher = data.azurerm_virtual_machine.example.storage_image_reference.publisher
    offer     = data.azurerm_virtual_machine.example.storage_image_reference.offer
    sku       = data.azurerm_virtual_machine.example.storage_image_reference.sku
    version   = data.azurerm_virtual_machine.example.storage_image_reference.version
  }

  storage_os_disk {
    name              = data.azurerm_virtual_machine.example.storage_os_disk.name
    caching           = data.azurerm_virtual_machine.example.storage_os_disk.caching
    create_option     = data.azurerm_virtual_machine.example.storage_os_disk.create_option
    managed_disk_type = data.azurerm_virtual_machine.example.storage_os_disk.managed_disk_type
  }

  os_profile {
    computer_name  = data.azurerm_virtual_machine.example.os_profile.computer_name
    admin_username = data.azurerm_virtual_machine.example.os_profile.admin_username
    admin_password = "YOUR_PASSWORD_HERE"

    linux_configuration {
      disable_password_authentication = data.azurerm_virtual_machine.example.os_profile.linux_configuration.disable_password_authentication
    }
  }
}
