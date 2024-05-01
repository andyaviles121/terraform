/*resource "azapi_resource" "OpenAIConnection" {
  type = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01"
  name = "Default_OpenAI"
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
*/

//Create an AI Services connection after the resource is created. 
//What is needed: API key after resource is created.
/*
resource "azapi_resource" "AIServicesConnection" {
  type = "Microsoft.MachineLearningServices/workspaces/connections@2024-04-01-preview"
  name = "Default_AIServices"
  parent_id = azapi_resource.hub.id

  body = jsonencode({
      properties = {
        category = "AIServices",
        target = jsondecode(azapi_resource.AIServicesResource.output).properties.endpoint,
        authType = "AAD", //  or "APIKey"
        isSharedToAll = true,
        metadata = {
          ApiType = "Azure",
          ResourceId = azapi_resource.AIServicesResource.id
        }
        
        credentials = {
            Key = "" // <- must input APIKey here
        }
        
      }
    })
  schema_validation_enabled = false
  response_export_values = ["*"]
}
*/