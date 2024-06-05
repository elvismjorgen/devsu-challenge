provider "azurerm" {
  skip_provider_registration = true

  features {}
}

provider "azurerm" {
  subscription_id = "31ed0ad0-bfa3-4ba0-9c3f-0975ab68ba7e"
  skip_provider_registration = true
  alias = "deploy"
  features {}
}