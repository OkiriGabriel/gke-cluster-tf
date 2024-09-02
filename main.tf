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
data "google_client_config" "provider" {}
data "google_container_cluster" "gke" {
  name     = "${ google_container_cluster.primary.name }"
  location = google_container_cluster.primary.location
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.gke.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.gke.master_auth[0].cluster_ca_certificate,
  )
}