resource "azurerm_resource_group" "resource_grp" {
  name     = var.rg_name
  location = var.rg_location
}

#vnet 1
resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name[0]
  location            = azurerm_resource_group.resource_grp.location
  address_space       = ["${element(var.address_sp, 0)}/${element(var.address_sp, 2)}"]
  resource_group_name = azurerm_resource_group.resource_grp.name
}

#subnet 1
resource "azurerm_subnet" "sn1" {
  name                 = var.subnet_name[0]
  resource_group_name  = azurerm_resource_group.resource_grp.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["${element(var.address_sp, 0)}/${element(var.address_sp, 3)}"]
}

#vnet 2
resource "azurerm_virtual_network" "vnet2" {
  name                = var.vnet_name[1]
  location            = azurerm_resource_group.resource_grp.location
  address_space       = ["${element(var.address_sp, 1)}/${element(var.address_sp, 2)}"]
  resource_group_name = azurerm_resource_group.resource_grp.name
}

#subnet-2
resource "azurerm_subnet" "sn2" {
  name                 = var.subnet_name[1]
  resource_group_name  = azurerm_resource_group.resource_grp.name
  virtual_network_name = azurerm_virtual_network.vnet2.name
  address_prefixes     = ["${element(var.address_sp, 1)}/${element(var.address_sp, 3)}"]
}

resource "azurerm_virtual_network_peering" "example-1" {
  name                      = var.peering_name[0]
  resource_group_name       = azurerm_resource_group.resource_grp.name
  virtual_network_name      = azurerm_virtual_network.vnet1.name
  remote_virtual_network_id = azurerm_virtual_network.vnet2.id
}

resource "azurerm_virtual_network_peering" "example-2" {
  name                      = var.peering_name[1]
  resource_group_name       = azurerm_resource_group.resource_grp.name
  virtual_network_name      = azurerm_virtual_network.vnet2.name
  remote_virtual_network_id = azurerm_virtual_network.vnet1.id
}



