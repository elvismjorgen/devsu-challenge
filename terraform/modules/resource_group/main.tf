resource "azurerm_resource_group" "this" {
  name     = "rg-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
  location = var.location

  tags = merge(
    var.common_config.tags,
    {
      name       = "rg-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
      managed-by = "Terraform"
    }
  )
}