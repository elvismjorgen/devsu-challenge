locals {
  env                 = "dev1"
  region              = "eastus"
  resource_group_name = "rg-devsu-devops-demo"
  aks_name            = "aks-devsu-devops-demo"
  aks_version         = "1.28.9"
  node_resource_group = "rg-devsu-devops-demo-nodes"

  tags = {
    Name = "Devsu DevOps Demo"
    Environment = "dev1"
    Company = "Devsu"
    Owner = "Elvis Manuel Jorge Nunez"
    Owner-Email = "elvismjorgen@gmail.com"
  }
}
