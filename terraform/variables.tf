########################################
#  Datos Generales del Proyecto
#

variable "project" {
  default     = "devsu-demo-devops"
}

variable "environment" {
  default     = "dev1"
}

variable "name" {
  default     = "elvismjn"
}


variable "region" {
  default      = "eastus"
}

variable "location" {
  default      = "eastus"
}

########################################
# Configuraciones Modulo Network     
###

variable "network" {
    type = object({
        vnet_adress_space=list(string),
        private_subnet_cidr=string,
        dns_servers=list(string)
  })

  default = {
    vnet_adress_space = [ "10.221.32.0/20" ],
    private_subnet_cidr = "10.221.32.64/26"
    dns_servers = [ "168.63.129.16" ]
  }

}

########################################
#  Configuraciones Modulo Kubernetes
###

variable "aks_node_pool" {
    type = object({
        name=string,
        availability_zones=list(number),
        vm=object({
          size=string,
          type=string
          os_disk_size_gb=string,
          os_disk_type=string
        })
        enable_auto_scaling=bool,
        node_count=number,
        max_count=number,
        min_count=number,
        max_surge=number,
        temporary_name_for_rotation=string
  })

    default = {
      name = "aksnodepool",
      availability_zones = [ 1, 3 ],
      vm = {
        size = "Standard_D2_v2",
        type = "VirtualMachineScaleSets",
        os_disk_size_gb = "512",
        os_disk_type = "Managed",
      },
      enable_auto_scaling = false,
      node_count = 2,
      min_count = null,
      max_count = null,
      max_surge = 2,
      temporary_name_for_rotation = "aksnodepool0"
    }

}

variable "private_cluster_enabled" {
  type        = bool
  description = "Indicates whether the cluster is enabled privately."
  default     = false
}

variable "private_dns_zone_id" {
  description = "Indicates whether the cluster is enabled privately."
  default     = null
}

variable "pod_ipv4_cidr_block" {
  default     = "10.28.0.0/14"
}

variable "service_ipv4_cidr_block" {
  default     = "10.38.0.0/16"
}

variable "dns_service_ip" {
  default     = "10.38.0.10"
}

variable "tenant_id"{
  default     = "97da8896-3e42-48ae-b9c1-41fc058e5693"
}

variable "admin_group_object_id" {
  default     = [
      "228a9382-ed35-4bb0-a855-4f1c79362542"
  ]
}

variable "local_account_disabled"{
  default     = false
}

variable "kubernetes_master_version"{
  default     = "1.28.9"
}

variable "kubernetes_node_version"{
  default     = "1.28.9"
}

########################################
#  Configuraciones Modulo Log Analytics
###
variable "log_analytics" {
    type = object({
        workspace_name=string,
        log_retention=number,
        log_daily_quota=number,
  })

    default = {
      workspace_name = "log-devsu-demo-dev-01"
      log_retention = 30
      log_daily_quota = 15
    }

}

########################################
#  Configuraciones Azure Container Registry
###

variable "acr_config" {
  description = "acr config"

  type = object({
    sku                 = string
    admin_enabled       = bool
    georeplications = optional(list(object({
      location = optional(string)
      zone_redundancy_enabled = bool
    })))
  })

  default = {
    sku = "Premium"
    admin_enabled = false
  }

}

########################################
#  Configuraciones VM Sonarqube
###

variable "vm_config" {
    type = object({
      vm_size = string,
      patch_mode = string,
      reboot_setting = string,
      admin_username = string,
      sku = string,
      offer = string,
      image_version = string,
      publisher = string
    })

    default = {
      vm_size = "Standard_B2s",
      patch_mode = "AutomaticByPlatform",
      reboot_setting = "IfRequired",
      admin_username = "demoadmin",
      sku = "22_04-lts",
      offer = "0001-com-ubuntu-server-jammy",
      image_version = "latest",
      publisher = "Canonical"
    }
}

variable "VM_PASSWORD" {
  description = "VM password"
  type        = string
  sensitive   = true
}

########################################
#  Configuraciones NIC
###

variable "name_ip_configuration" {
  type    = string
  default = "nic-devsu-demo-dev-01"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

variable "tags" {
  description = "General Tags"
  type        = map(string)
  default = {
    enviroment       = "dev1"
    project-name     = "demo-devops"
  }
}

variable "resource_number" {
  description = "Secuencia inicial para recursos en general"
  type        = string
  default     = "1"
}