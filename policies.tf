terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
}

# Policy to ensure all GKE clusters are private
resource "google_org_policy" "gke_disable_public_ip" {
  constraint = "compute.vmExternalIpAccess"

  list_policy {
    deny {
      all = true
    }
  }
}

# Policy to enforce mandatory labels
resource "google_org_policy" "mandatory_labels" {
  constraint = "compute.requireLabels"

  list_policy {
    allow {
      values = ["environment", "project"]
    }
  }
}

# Policy to restrict certain service account creation
resource "google_org_policy" "restrict_service_accounts" {
  constraint = "iam.disableServiceAccountCreation"

  boolean_policy {
    enforced = true
  }
}