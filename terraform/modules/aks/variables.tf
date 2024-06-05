########################
#        Project       #
########################

variable "project" {}

variable "environment" {}

variable "tags" {
  description = "A mapping of tags to assign to AKS Cluster"
  type        = map(string)
  default = {}
}

########################
#    Resource Group    #
########################

variable "rg_name" {}

variable "rg_location" {}

variable "rg_id" {}

########################
#       Network        #
########################

variable "vnet_id" {}

variable "pod_ipv4_cidr_block" {}

variable "service_ipv4_cidr_block" {}

variable "dns_service_ip" {}

variable "dns_prefix" {}

########################
#     Node Pools       #
########################

variable "default_node_pool" {}

########################
#   Active Directory   #
########################

variable "tenant_id" {}

variable "admin_group_object_id" {}

variable "local_account_disabled" {}

variable "kubernetes_master_version" {}

variable "kubernetes_node_version" {}


############################
#    SKU API Kubernetes    #
############################

variable "sku_tier" {
  default = "Free"
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}