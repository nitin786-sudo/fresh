resource "azurerm_subnet" "name" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = var.vnetname
  address_prefixes     = var.subnetaddress
}

my name is lakhan xyz byx



