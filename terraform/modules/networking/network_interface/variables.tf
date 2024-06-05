
variable "common_config" {
  description = "Network Interface Common Config"

  type = object({
    name            = string
    tags            = map(string)
    environment     = string
    resource_number = string
  })

}

variable "network_interface_config" {
  description = "Network Interface Config"

  type = object({
    location                      = string
    edge_zone                     = optional(string)
    dns_servers                   = optional(list(string))
    auxiliary_sku                 = optional(string)
    auxiliary_mode                = optional(string)
    resource_group_name           = string
    enable_ip_forwarding          = optional(bool)
    internal_dns_name_label       = optional(string)
    enable_accelerated_networking = optional(bool)

    ip_configuration = object({
      name                          = string
      primary                       = optional(bool)
      subnet_id                     = string
      private_ip_address            = optional(string)
      public_ip_address_id          = optional(string)
      private_ip_address_version    = optional(string)
      private_ip_address_allocation = string
    })

  })
}
