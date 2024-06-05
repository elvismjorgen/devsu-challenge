resource "azurerm_log_analytics_workspace" "logs" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  sku                 = var.la_sku
  retention_in_days   = var.log_retention
  daily_quota_gb      = var.log_daily_quota
  tags                = var.tags
}