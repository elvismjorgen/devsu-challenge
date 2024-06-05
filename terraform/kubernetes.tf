module "kubernetes" {
  source = "./modules/aks"

  environment               = var.environment
  project                   = var.project
  pod_ipv4_cidr_block       = var.pod_ipv4_cidr_block
  service_ipv4_cidr_block   = var.service_ipv4_cidr_block
  dns_service_ip            = var.dns_service_ip
  rg_name                   = module.resource_group.name
  rg_location               = module.resource_group.location
  rg_id                     = module.resource_group.id
  tenant_id                 = var.tenant_id
  admin_group_object_id     = var.admin_group_object_id
  local_account_disabled    = var.local_account_disabled
  kubernetes_master_version = var.kubernetes_master_version
  kubernetes_node_version   = var.kubernetes_node_version

  dns_prefix                = "aks-${var.project}-${var.environment}"

  vnet_id                    = module.virtual_network.id
  log_analytics_workspace_id = module.la_wks_aks.log_analytics_workspace_id

  default_node_pool = {
    name                        = var.aks_node_pool.name,
    availability_zones          = var.aks_node_pool.availability_zones,
    vnet_subnet_id              = module.subnet.private_ids[0],
    vm_size                     = var.aks_node_pool.vm.size,
    os_disk_size_gb             = var.aks_node_pool.vm.os_disk_size_gb,
    os_disk_type                = var.aks_node_pool.vm.os_disk_type,
    type                        = var.aks_node_pool.vm.type,
    enable_auto_scaling         = var.aks_node_pool.enable_auto_scaling,
    node_count                  = var.aks_node_pool.node_count,
    max_count                   = var.aks_node_pool.max_count,
    min_count                   = var.aks_node_pool.min_count,
    max_surge                   = var.aks_node_pool.max_surge,
    temporary_name_for_rotation = var.aks_node_pool.temporary_name_for_rotation
  }

  tags = var.tags

  providers = {
    azurerm = azurerm.deploy
  }

}