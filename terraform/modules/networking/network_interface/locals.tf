
locals {
  name = "nic-${var.common_config.name}-${var.common_config.environment}-${format("%02d", var.common_config.resource_number)}"
}