resource "azurerm_resource_group" "default" {
  name     = "azapi-terraform-rg-${var.try}"
  location = "East US"
}

resource "azurerm_storage_account" "default" {
  name                            = "${var.names}st${var.try}"
  location                        = azurerm_resource_group.default.location
  resource_group_name             = azurerm_resource_group.default.name
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_key_vault" "default" {
  name                     = "${var.names}kv${var.try}"
  location                 = azurerm_resource_group.default.location
  resource_group_name      = azurerm_resource_group.default.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "premium"
  purge_protection_enabled = false
}

resource "azurerm_cognitive_account" "default" {
    name                = "${var.names}cognitiveaccount${var.try}"
    location            = azurerm_resource_group.default.location
    resource_group_name = azurerm_resource_group.default.name
    sku_name            = var.sku
    kind                = "OpenAI"
}