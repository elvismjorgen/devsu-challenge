
module "virtual_network" {
  source = "./modules/networking/vnet"

  common_config = {
    name            = var.name
    environment     = var.environment
    resource_number = var.resource_number

    tags = var.tags

  }

  vnet_config = {
    location            = module.resource_group.location
    dns_servers         = var.network.dns_servers
    address_space       = var.network.vnet_adress_space
    resource_group_name = module.resource_group.name
  }

  providers = {
    azurerm = azurerm.deploy
  }
}

module "subnet" {
  source = "./modules/networking/subnet"

  common_config = {
    name        = var.name
    environment = var.environment

    tags = var.tags
  }

  subnet_config = [
    {
      subnet_type          = "prv"
      resource_number      = 1
      address_prefixes     = [var.network.private_subnet_cidr]
      resource_group_name  = module.resource_group.name
      virtual_network_name = module.virtual_network.name
    }
  ]

  providers = {
    azurerm = azurerm.deploy
  }
}

module "pip" {
  source = "./modules/networking/public_ip"

  common_config = {
    name            = var.name
    tags            = var.tags
    environment     = var.environment
    resource_number = 1
  }

  pip_config = {
    sku                 = "Standard"
    zones               = ["1", "2", "3"]
    location            = var.location
    domain_name_label   = "domain${var.name}${var.environment}01"
    allocation_method   = "Static"
    resource_group_name = module.resource_group.name
  }

  providers = {
    azurerm = azurerm.deploy
  }
}
