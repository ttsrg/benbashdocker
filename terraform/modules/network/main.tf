resource "google_compute_network" "vpc" {
  name                    = "a-virtual-network"
  auto_create_subnetworks = false
  ### routing_mode?  
}

resource "google_compute_subnetwork" "subnet" {
  name                     = "subnetwork-private"
  ip_cidr_range            = "10.10.0.0/16"
  region                   = "europe-west1"
  private_ip_google_access = true
  network                  = "${google_compute_network.vpc.self_link}"
  secondary_ip_range {
    range_name    = "secondary-range-subnet"
    ip_cidr_range = "192.168.10.0/24"
  }
}

