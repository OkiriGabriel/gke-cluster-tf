resource "google_compute_network" "vpc" {
  name                    = "vpc-network"
  auto_create_subnetworks = false
}

# Define a subnet within the VPC network
resource "google_compute_subnetwork" "subnet" {
  name          = "my-subnet"
  ip_cidr_range  = "10.0.1.0/24"  # CIDR block for the subnet
  network        = google_compute_network.vpc.id
  region         = "us-central1"
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}