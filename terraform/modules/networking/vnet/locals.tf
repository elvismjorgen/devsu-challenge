
locals {
  subnet               = var.vnet_config.subnet != null ? { for idx, subnet in var.vnet_config.subnet : idx => subnet } : {}
  vnet_name            = "vnet-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
  ddos_protection_plan = var.vnet_config.ddos_protection_plan != null ? { 0 = var.vnet_config.ddos_protection_plan } : {}
}