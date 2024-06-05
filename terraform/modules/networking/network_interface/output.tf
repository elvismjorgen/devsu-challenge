
output "id" {
  description = "VNET ID"
  value       = azurerm_network_interface.this.id
}

output "mac_address" {
  description = "MAC Address"
  value       = azurerm_network_interface.this.mac_address
}

output "private_ip_address" {
  description = "Private IP Address"
  value       = azurerm_network_interface.this.private_ip_address
}

