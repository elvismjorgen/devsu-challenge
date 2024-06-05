
resource "azurerm_virtual_network" "this" {
  name                = local.vnet_name
  location            = var.vnet_config.location
  dns_servers         = var.vnet_config.dns_servers
  address_space       = var.vnet_config.address_space
  bgp_community       = var.vnet_config.bgp_community
  resource_group_name = var.vnet_config.resource_group_name

  dynamic "subnet" {
    for_each = local.subnet

    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group
    }
  }

  dynamic "ddos_protection_plan" {
    for_each = local.ddos_protection_plan

    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }

  tags = {
      Name      = local.vnet_name
      ManagedBy = "Terraform"
    }
}
