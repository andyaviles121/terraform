resource "azapi_resource" "hub" {
  type = "Microsoft.MachineLearningServices/workspaces@2023-10-01"
  name = "myworkspace"
  location = azurerm_resource_group.default.location
  parent_id = azurerm_resource_group.default.id

  identity {
    type = "SystemAssigned"
  }

  body = jsonencode({
    properties = {
      description = "This is my Azure AI hub"
      friendlyName = "My Hub"
      storageAccount = azurerm_storage_account.default.id
      keyVault = azurerm_key_vault.default.id
      // applicationInsight = 
      // containerRegistry = 
    }
    kind = "hub"
  })
}