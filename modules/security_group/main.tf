resource "azurerm_network_security_group" "backend_sg" {
  name                = var.sg_name
  location            = var.location
  resource_group_name = var.rg_name

  security_rule {
    name                       = "8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet_network_security_group_association" "backend_sg_asso" {
  subnet_id                 = var.subnet_be_id
  network_security_group_id = azurerm_network_security_group.backend_sg.id
}