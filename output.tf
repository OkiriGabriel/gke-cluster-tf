output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "region" {
  value       = var.region
  description = "GCloud Region"
}

# output "api_ip" {
#   value       = kubernetes_service.api.status.0.load_balancer.0.ingress.0.ip
#   description = "External IP address of the API service"
# }