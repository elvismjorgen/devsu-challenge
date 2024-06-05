
output "id" {
  description = "vnet id"
  value       = azurerm_virtual_network.this.id
}

output "name" {
  description = "vnet name"
  value       = azurerm_virtual_network.this.name
}

output "subnet_ids" {
  description = " vnet sutnets id"
  value       = azurerm_virtual_network.this.subnet[*].id
}

output "dns_servers" {
  description = "vnet dns servers"
  value       = azurerm_virtual_network.this.dns_servers
}
