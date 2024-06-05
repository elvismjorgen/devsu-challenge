
output "public_ids" {
  description = "Subnet Public IDs"
  value       = [for subnet in azurerm_subnet.this : subnet.id if startswith(subnet.name, "snet-pub")]
}

output "private_ids" {
  description = "Subnet Private IDs"
  value       = [for subnet in azurerm_subnet.this : subnet.id if startswith(subnet.name, "snet-prv")]
}

output "protected_ids" {
  description = "Subnet Protected Ids"
  value       = [for subnet in azurerm_subnet.this : subnet.id if startswith(subnet.name, "snet-pro")]
}