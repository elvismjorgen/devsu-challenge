
variable "common_config" {
  description = "Resource Group Configuration"

  type = object({
    name            = string
    tags            = map(string)
    environment     = string
    resource_number = number
  })
}

variable "location" {
  description = "Region Where The RG Will Be Deployed"
  type        = string
}