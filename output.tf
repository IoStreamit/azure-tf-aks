output "id" {
  description = "Kubernetes managed cluster id"  
  value       = azurerm_kubernetes_cluster.aks.id
}

output "fqdn" {
  description = "FQDN of AKS cluster."  
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "kube_admin_config" {
  description = "A kube_admin_config block as defined below. This is only available when Role Based Access Control with Azure Active Directory is enabled."  
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config
  sensitive   = true
}

output "kube_admin_config_raw" {
  description = "Raw Kubernetes config for the admin account to be used by kubectl and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled."
  value       = azurerm_kubernetes_cluster.aks.kube_admin_config_raw
  sensitive   = true  
}

output "kube_config" {
  description = "Cluster Kubernetes configuration object"  
  value       = azurerm_kubernetes_cluster.aks.kube_config
  sensitive   = true
}

output "kube_config_raw" {
  description = "Cluster Kubernetes configuration raw file"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true  
}

output "node_resource_group" {
  description = "The auto-generated Resource group which contains the resources for this Managed Kubernetes Cluster."
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}