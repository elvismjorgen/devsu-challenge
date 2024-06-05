
variable "common_config" {
  description = "vnet commun config"

  type = object({
    name            = string
    tags            = map(string)
    environment     = string
    resource_number = string
  })
}

variable "vnet_config" {
  description = "vnet config"

  type = object({
    location            = string
    dns_servers         = optional(list(string))
    address_space       = list(string)
    bgp_community       = optional(string)
    resource_group_name = string

    subnet = optional(list(object({
      name = optional(string)
      address_prefix = string
      security_group = optional(string)
    })))

    ddos_protection_plan = optional(object({
      id     = string
      enable = bool
    }))

  })
}