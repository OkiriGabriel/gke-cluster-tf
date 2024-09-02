# resource "google_service_account" "gke_sa" {
#   account_id   = "shortlet-api"
#   display_name = "gke-k8s"
# }

# resource "google_project_iam_member" "gke_sa_roles" {
#   for_each = toset([
#     "roles/container.admin",
#     "roles/storage.objectViewer",
#     "roles/logging.logWriter",
#     "roles/monitoring.metricWriter",
#   ])
  
#   project = var.project_id
#   role    = each.key
#   member  = "serviceAccount:${google_service_account.gke_sa.email}"
# }

# resource "google_service_account_iam_binding" "gke_sa_user" {
#   service_account_id = google_service_account.gke_sa.name
#   role               = "roles/iam.serviceAccountUser"

#   members = [
#     "serviceAccount:${google_service_account.gke_sa.email}",
#   ]
# }