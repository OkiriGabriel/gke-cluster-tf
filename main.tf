provider "google" {
  project = var.project_id
  region  = var.region
}

# provider "kubernetes" {
#   host                   = "https://${module.gke.endpoint}"
#   token                  = data.google_client_config.default.access_token
#   cluster_ca_certificate = base64decode(module.gke.ca_certificate)
# }

# Obtain the credentials for the cluster
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = google_container_cluster.gke.endpoint
  token                  = data.google_client_config.default.access_token
  # Optionally add TLS config if needed
  # tls_config {
  #   ca_certificate = data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate
  # }
}