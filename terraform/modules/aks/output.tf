output "aks_ca_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
  sensitive = true
}

output "aks_host" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.host
  sensitive = true
}

output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "aks_oms_agent_id" {
  value = azurerm_kubernetes_cluster.aks.oms_agent[0].oms_agent_identity[0].object_id
}
