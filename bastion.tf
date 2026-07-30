resource "azurerm_public_ip" "example" {
  name                = "examplepip"
  location            = azurerm_resource_group.resource_grp.location
  resource_group_name = azurerm_resource_group.resource_grp.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "bastion_sn" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.resource_grp.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.255.0/26"]
}

resource "azurerm_bastion_host" "example" {
  name                = "peer-1-bastion"
  location            = azurerm_resource_group.resource_grp.location
  resource_group_name = azurerm_resource_group.resource_grp.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.bastion_sn.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}