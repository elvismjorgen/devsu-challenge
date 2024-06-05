
locals {
  subnet = { for idx, subnet in var.subnet_config : idx + 1 => subnet }
}
