
resource "azurerm_subnet" "this" {
  for_each = local.subnet

  name                        = "snet-${each.value.subnet_type}-${var.common_config.name}-${var.common_config.environment}-${format("%02d", each.value.resource_number)}"
  address_prefixes            = each.value.address_prefixes
  service_endpoints           = each.value.service_endpoints
  resource_group_name         = each.value.resource_group_name
  virtual_network_name        = each.value.virtual_network_name
  service_endpoint_policy_ids = each.value.service_endpoint_policy_ids

  dynamic "delegation" {
    for_each = each.value.delegation != null ? { for idx, delegation in each.value.delegation : idx => delegation } : {}

    content {
      name = each.value.name

      service_delegation {
        name    = each.value.service_delegation.name
        actions = each.value.service_delegation.actions
      }
    }
  }
}