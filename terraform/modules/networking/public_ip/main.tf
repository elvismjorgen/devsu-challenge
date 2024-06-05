
resource "azurerm_public_ip" "this" {
  name                    = local.pip_name
  location                = var.pip_config.location
  resource_group_name     = var.pip_config.resource_group_name
  allocation_method       = var.pip_config.allocation_method
  zones                   = var.pip_config.zones
  ip_tags                 = var.pip_config.ip_tags
  sku                     = var.pip_config.sku
  sku_tier                = var.pip_config.sku_tier
  ip_version              = var.pip_config.ip_version
  ddos_protection_mode    = var.pip_config.ddos_protection_mode
  ddos_protection_plan_id = var.pip_config.ddos_protection_mode == "Enabled" ? var.pip_config.ddos_protection_plan_id : null
  domain_name_label       = var.pip_config.domain_name_label
  edge_zone               = var.pip_config.edge_zone
  idle_timeout_in_minutes = var.pip_config.idle_timeout_in_minutes
  public_ip_prefix_id     = var.pip_config.public_ip_prefix_id
  reverse_fqdn            = var.pip_config.reverse_fqdn
  tags                    = merge(
    var.common_config.tags,
    {
      Name      = local.pip_name
      ManagedBy = "Terraform"
    }
  )
}