# resource "google_container_cluster" "primary" {
#   name     = "gke-cluster"
#   location = var.region

#   remove_default_node_pool = true
#   initial_node_count       = 1

#   network    = google_compute_network.vpc.name
#   subnetwork = google_compute_subnetwork.subnet.name
# }

resource "google_container_cluster" "primary" {
  name     = "k8s-cluster"
 location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  # remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection = false
  enable_autopilot = true

  node_config {
    disk_size_gb = 50
  }

}

# resource "google_container_node_pool" "primary_nodes" {
#   name       = "node-pool"
#   location   = var.region
  
#   cluster    = google_container_cluster.primary.name
#   node_count = var.gke_num_nodes

#   node_config {
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]

#     labels = {
#       env = var.project_id
#     }
#    disk_size_gb = 10 # 
#     machine_type = var.machine_type
#     tags         = ["gke-node", "${var.project_id}-gke"]
#     metadata = {
#       disable-legacy-endpoints = "true"
#     }
#   }
# }