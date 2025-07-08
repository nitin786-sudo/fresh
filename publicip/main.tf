# resource "azurerm_public_ip" "example" {
#   name                = var.publicip
#   resource_group_name = var.rgname
#   location            = var.rglocation
#   allocation_method   = "Static"
# }