
variable "common_config" {
  description = "PIP Common Config"

  type = object({
    name            = string
    tags            = map(string)
    environment     = string
    resource_number = string
  })
}

variable "pip_config" {
  description = "PIP Config"

  type = object({
    location                = string    
    allocation_method       = string
    zones                   = optional(list(string))
    ip_tags                 = optional(map(string))
    sku                     = optional(string)
    sku_tier                = optional(string)
    ip_version              = optional(string)
    ddos_protection_mode    = optional(string)
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    edge_zone               = optional(string)
    idle_timeout_in_minutes = optional(number)
    public_ip_prefix_id     = optional(string)
    reverse_fqdn            = optional(string)
    resource_group_name     = string
  })
}