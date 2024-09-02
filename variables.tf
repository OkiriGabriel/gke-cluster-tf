variable "project_id" {
  description = "The project ID to host the cluster in"
  type        = string
  default = "gke-ks"
}

variable "region" {
  description = "The region to host the cluster in"
  type        = string
  default     = "us-central1"
}

variable "gke_num_nodes" {
  description = "Number of nodes in the GKE cluster"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
  default     = "e2-micro"
}

variable "min_master_version" {
  description = "Minimum version of the master"
  type        = string
  default     = "1.21"
}

variable "image_tag" {
  description = "Tag for the Docker image"
  type        = string
  default = "shortlet"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}