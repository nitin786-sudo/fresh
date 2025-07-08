# data "azurerm_subnet" "examplesubnet" {
#   name                 = var.subnet
#   virtual_network_name = var.vnetname
#   resource_group_name  = var.rgname
# }

# data "azurerm_public_ip" "examplepip" {
#   name                = var.publicip
#   resource_group_name = var.rgname
# }

# data "azurerm_key_vault" "example" {
#   name                = var.keyvaultname
#   resource_group_name = var.RG
# }

# data "azurerm_key_vault_secret" "example" {
#   name         = var.secretname
#   key_vault_id = data.azurerm_key_vault.example.id
# }

# data "azurerm_key_vault_secret" "example1" {
#   name         = var.secretpass
#   key_vault_id = data.azurerm_key_vault.example.id
# }

# resource "azurerm_network_interface" "NIC" {
#   name                = var.nic
#   location            = var.rglocation
#   resource_group_name = var.rgname

#   ip_configuration {
#     public_ip_address_id = data.azurerm_public_ip.examplepip.id
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.examplesubnet.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "example" {
#   name                = var.vmname
#   resource_group_name = var.rgname
#   location            = var.rglocation
#   size                = "Standard_B1s"
# #   admin_username      = "adminuser"
# #   admin_password = "Password1234!"
# admin_username      = data.azurerm_key_vault_secret.example.value
# admin_password = data.azurerm_key_vault_secret.example1.value
#   disable_password_authentication = false
#   network_interface_ids = [
#     azurerm_network_interface.NIC.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-focal"
#     sku       = "20_04-lts"
#     version   = "latest"
#   }
#     custom_data = base64encode(<<-EOF
#     #!/bin/bash
#     apt-get update
#     apt-get install -y nginx
#     systemctl enable nginx
#     systemctl start nginx
#   EOF
#   )

# }