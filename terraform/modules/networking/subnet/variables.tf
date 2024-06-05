
variable "common_config" {
  description = "subnet commun config"

  type = object({
    tags        = map(string)
    name        = string
    environment = string
  })
}

variable "subnet_config" {
  description = "subnet config"

  type = list(object({
    subnet_type                 = string
    resource_number             = number
    address_prefixes            = list(string)
    service_endpoints           = optional(list(string))
    resource_group_name         = string
    virtual_network_name        = string
    service_endpoint_policy_ids = optional(list(string))

    delegation = optional(list(object({
      name = string

      service_delegation = object({
        name    = string
        actions = list(string)
      })

    })))

  }))

  validation {
    condition = length(
      [for entry in var.subnet_config : entry if contains(["pub", "prv", "pro"], entry.subnet_type)]
    ) >= length(var.subnet_config)
    error_message = "The variable 'subnet_type' must be only: 'pub', 'prv' or 'pro'."
  }
}
