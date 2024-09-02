
# # Policy to ensure all GKE clusters are private
# resource "google_org_policy" "gke_disable_public_ip" {
#   constraint = "constraints/compute.vmExternalIpAccess"

#   policy_data = jsonencode({
#     "enforced" = true
#   })
# }

# # Policy to enforce mandatory labels
# resource "google_org_policy" "mandatory_labels" {
#   constraint = "compute.requireLabels"

#   list_policy {
#     allow {
#       values = ["environment", "project"]
#     }
#   }
# }

# # Policy to restrict certain service account creation
# resource "google_org_policy" "restrict_service_accounts" {
#   constraint = "iam.disableServiceAccountCreation"

#   boolean_policy {
#     enforced = true
#   }
# }