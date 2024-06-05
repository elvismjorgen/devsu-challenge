module "resource_group" {
  source = "./modules/resource_group"

  common_config = {
    name            = var.name
    tags            = var.tags
    environment     = var.environment
    resource_number = var.resource_number
  }

  location = var.location

}