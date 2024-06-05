output "id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.this.id
}

output "name" {
  description = "Resource Group Name"
  value = data.azurerm_resource_group.this.name
}

output "location" {
  description = "Resource Group Region"
  value = data.azurerm_resource_group.this.location
}