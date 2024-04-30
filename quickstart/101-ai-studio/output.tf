output "HubId" {
    value = azapi_resource.hub.id
}

output "ProjectId" {
    value = azapi_resource.project.id
}

output "endpoint" {
  value = jsondecode(azapi_resource.AIServicesResource.output).properties.endpoint
}