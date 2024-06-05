variable "name" {}

variable "tags" {
  description = "A mapping of tags to assign on routing table."
  type        = map(string)
  default = {}
}


variable "rg_location" {}

variable "rg_name" {}

variable "la_sku" {
    default = "PerGB2018" 
}

variable "log_retention" {}

variable "log_daily_quota" {}