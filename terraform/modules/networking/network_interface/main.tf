
resource "azurerm_network_interface" "this" {
  name                          = local.name
  location                      = var.network_interface_config.location
  edge_zone                     = var.network_interface_config.edge_zone
  dns_servers                   = var.network_interface_config.dns_servers
  auxiliary_sku                 = var.network_interface_config.auxiliary_sku
  auxiliary_mode                = var.network_interface_config.auxiliary_mode
  resource_group_name           = var.network_interface_config.resource_group_name
  enable_ip_forwarding          = var.network_interface_config.enable_ip_forwarding
  internal_dns_name_label       = var.network_interface_config.internal_dns_name_label
  enable_accelerated_networking = var.network_interface_config.enable_accelerated_networking

  ip_configuration {
    name                          = var.network_interface_config.ip_configuration.name
    primary                       = var.network_interface_config.ip_configuration.primary
    subnet_id                     = var.network_interface_config.ip_configuration.subnet_id
    private_ip_address            = var.network_interface_config.ip_configuration.private_ip_address
    public_ip_address_id          = var.network_interface_config.ip_configuration.public_ip_address_id
    private_ip_address_version    = var.network_interface_config.ip_configuration.private_ip_address_version
    private_ip_address_allocation = var.network_interface_config.ip_configuration.private_ip_address_allocation
  }

  tags = merge(
    var.common_config.tags,
    {
      Name      = local.name
      ManagedBy = "Terraform"
    }
  )
}