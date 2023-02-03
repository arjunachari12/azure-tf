resource "azurerm_virtual_ma" "name" {
  count = 10
  name = "VM"${count.index}
}
