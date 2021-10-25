
resource "azurerm_virtual_network" "vn" {
    address_space = var.vn_cidr
    name = var.vn_name
    location = var.location
    resource_group_name = var.rg_name
}

resource "azurerm_subnet" "frountend" {
    name = var.sn_fe_name
    address_prefixes = var.sn_fe_cidr
    virtual_network_name = var.vn_name
    resource_group_name = var.rg_name
    depends_on = [
      azurerm_virtual_network.vn,
    ]
}

resource "azurerm_subnet" "backend" {
    name = var.sn_be_name
    address_prefixes = var.sn_be_cidr
    virtual_network_name = var.vn_name
    resource_group_name = var.rg_name
    depends_on = [
      azurerm_virtual_network.vn,
    ]
}
