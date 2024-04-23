resource "azurerm_resource_group" "default" {
  name     = "azapi-template-rg-${var.names}"
  location = "East US"
}

resource "azurerm_storage_account" "default" {
  name                            = "${var.names}storage"
  location                        = azurerm_resource_group.default.location
  resource_group_name             = azurerm_resource_group.default.name
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_key_vault" "default" {
  name                     = "${var.names}keyvault"
  location                 = azurerm_resource_group.default.location
  resource_group_name      = azurerm_resource_group.default.name
  tenant_id                = data.azurerm_client_config.current.tenant_id
  sku_name                 = "premium"
  purge_protection_enabled = false
}

resource "azurerm_cognitive_account" "default" {
    name                = "${var.names}cognitiveaccount"
    location            = azurerm_resource_group.default.location
    resource_group_name = azurerm_resource_group.default.name
    sku_name            = var.sku
    kind                = "OpenAI"
}

/* The following resources are OPTIONAL.
resource "azurerm_application_insights" "default" {
  name                = "${var.names}appinsights"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  application_type    = "web"
}

resource "azurerm_container_registry" "default" {
  name                     = "${var.names}contreg"
  resource_group_name      = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku                      = "premium"
  admin_enabled            = true
}
*/