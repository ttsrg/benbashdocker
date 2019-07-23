resource "google_compute_firewall" "http-80" {
  name    = "http-80"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.port_number}"]
  }
}
