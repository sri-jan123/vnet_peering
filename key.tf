data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                = "examplekeyvault12345"
  location            = azurerm_resource_group.resource_grp.location
  resource_group_name = azurerm_resource_group.resource_grp.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "Set"
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_password" {
  name         = "vm-admin-password"
  value        = "Password1234!"
  key_vault_id = azurerm_key_vault.example.id
}