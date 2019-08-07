resource "google_compute_network" "vpc3" {
  name                    = "a3-virtual-network"
  auto_create_subnetworks = false
  ### routing_mode?  
}

resource "google_compute_subnetwork" "subnet3" {
  name                     = "subnetwork3-private"
  ip_cidr_range            = "10.200.200.0/24"
  region                   = "europe-west1"
  private_ip_google_access = true
  network                  = "${google_compute_network.vpc3.self_link}"
  secondary_ip_range {
    range_name    = "secondary3-range-subnet"
    ip_cidr_range = "172.20.20.0/24"
  }
}

resource "google_compute_firewall" "sg3" {
  name = "sg3"
  #    network = "default"
  network = google_compute_network.vpc3.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = "${var.ports_number}"
  }
}
