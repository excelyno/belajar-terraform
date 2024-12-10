resource "google_compute_firewall" "rules" {
    project = "nasir-441404"
    name = "allow-webserver-excel"
    network = "excel-vpc"
    description = "allow webserver"

    allow {
      protocol = "tcp"
      ports = ["22"]
    }

    source_ranges = ["0.0.0.0/0"]

    target_tags = ["webserver"]
}
terraform {
  required_version = ">= 0.13"
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "~> 5.1.0"
    }
  }
  backend "gcs" {
    bucket = "excel-terraform-state"
    prefix = "firewall/"
  }
}