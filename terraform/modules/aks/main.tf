resource "azurerm_kubernetes_cluster" "aks" {
  name                         = "aks-${var.project}-${var.environment}-cluster"
  location                     = var.rg_location
  resource_group_name          = var.rg_name
  node_resource_group          = "rg-${var.project}-${var.environment}-aks-nodes"
  dns_prefix                   = var.dns_prefix
  kubernetes_version           = var.kubernetes_master_version
  local_account_disabled       = var.local_account_disabled
  sku_tier                     = var.sku_tier
  image_cleaner_enabled        = false
  image_cleaner_interval_hours = 48

  role_based_access_control_enabled = true

  dynamic "microsoft_defender" {
    for_each = var.log_analytics_workspace_id != null ? [1] : []
    content {
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  azure_active_directory_role_based_access_control {
    managed                = true
    tenant_id              = var.tenant_id
    admin_group_object_ids = var.admin_group_object_id
    azure_rbac_enabled     = false
  }

  maintenance_window {
    allowed {
      day   = "Saturday"
      hours = [23]
    }

    allowed {
      day   = "Sunday"
      hours = [0, 1, 2]
    }
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "kubenet"
    network_policy    = "calico"
    outbound_type     = "loadBalancer"

    # IP Address Range to Use
    pod_cidr       = var.pod_ipv4_cidr_block
    service_cidr   = var.service_ipv4_cidr_block
    dns_service_ip = var.dns_service_ip
  }

  default_node_pool {
    name  = var.default_node_pool.name
    zones = var.default_node_pool.availability_zones

    # Network
    vnet_subnet_id        = var.default_node_pool.vnet_subnet_id
    enable_node_public_ip = false

    # Nodes (VM)
    vm_size         = var.default_node_pool.vm_size
    os_disk_size_gb = var.default_node_pool.os_disk_size_gb
    os_disk_type    = var.default_node_pool.os_disk_type

    # Autoscaling
    type                = var.default_node_pool.type
    enable_auto_scaling = var.default_node_pool.enable_auto_scaling
    node_count          = var.default_node_pool.node_count
    max_count           = var.default_node_pool.max_count
    min_count           = var.default_node_pool.min_count

    orchestrator_version = var.kubernetes_node_version

    temporary_name_for_rotation = var.default_node_pool.temporary_name_for_rotation

    upgrade_settings {
      max_surge = var.default_node_pool.max_surge
    } 

  }

  identity {
    type         = "SystemAssigned"
    # identity_ids = [var.aks_identity]
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  azure_policy_enabled = true

  tags = var.tags

}