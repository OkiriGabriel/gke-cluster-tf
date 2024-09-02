terraform {
  backend "gcs" {
    bucket  = "terraform_shortlet"
    prefix  = "terraform/state"
  }
}