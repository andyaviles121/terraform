resource "azapi_resource" "connection" {
  type = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01" // @2024-01-01-preview ?
  name = "Default_AzureAIServices"
  parent_id = azapi_resource.hub.id

  body = jsonencode({
      properties = {
        category = "OpenAI",
        target = azurerm_cognitive_account.default.endpoint,
        authType = "ApiKey",
        isSharedToAll = true,
        metadata = {
          ApiType = "Azure",
          ResourceId = azurerm_cognitive_account.default.id
        }
        credentials = {
            Key = azurerm_cognitive_account.default.primary_access_key
        }
      }
    })

  schema_validation_enabled = false
}