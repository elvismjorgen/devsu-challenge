terraform {
  backend "azurerm" {
    resource_group_name  = "backend-terraform-rg"
    storage_account_name = "terraformstatefilesemjn"
    container_name       = "devsu"
    key                  = "terraform.tfstate"
  }
}
