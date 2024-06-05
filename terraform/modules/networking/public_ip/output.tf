
output "public_ip_id" {
  description = "ID of the Public IP Resource"
  value       = azurerm_public_ip.this.id
}

output "public_ip_address" {
  description = "Assigned Public IP Address."
  value       = azurerm_public_ip.this.ip_address
}