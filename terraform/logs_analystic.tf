module "la_wks_aks" {
  source          = "./modules/log_analytics"
  name            = var.log_analytics.workspace_name
  rg_location     = module.resource_group.location
  rg_name         = module.resource_group.name
  log_retention   = var.log_analytics.log_retention
  log_daily_quota = var.log_analytics.log_daily_quota

  tags = var.tags

  providers = {
    azurerm = azurerm.deploy
  }
}