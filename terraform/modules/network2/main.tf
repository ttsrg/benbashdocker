resource "google_compute_network" "vpc2" {
  name                    = "a2-virtual-network"
  auto_create_subnetworks = false
  ### routing_mode?  
}

resource "google_compute_subnetwork" "subnet2" {
  name                     = "subnetwork2-private"
  ip_cidr_range            = "10.100.0.0/16"
  region                   = "europe-west1"
  private_ip_google_access = true
  network                  = "${google_compute_network.vpc2.self_link}"
  secondary_ip_range {
    range_name    = "secondary2-range-subnet"
    ip_cidr_range = "172.16.100.0/24"
  }
}

resource "google_compute_firewall" "sg" {
  name = "sg"
  #    network = "default"
  network = google_compute_network.vpc2.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = "${var.ports_number}"
  }
}
