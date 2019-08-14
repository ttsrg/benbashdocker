resource "google_compute_network" "vpc3" {
  name                    = "a3-virtual-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet3" {
  name          = "subnetwork3-private-${var.vregion}"
  region        = var.mregions[var.vregion]
  ip_cidr_range = "${lookup(var.mregion_ip_cidr_range, "${var.mregions[var.vregion]}")}"

  private_ip_google_access = true
  network                  = "${google_compute_network.vpc3.self_link}"

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
