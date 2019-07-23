resource "google_compute_firewall" "web" {
  name    = "tcp-80"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.port_number_web}"]
  }
}



resource "google_compute_firewall" "db" {
  name    = "tcp-5432"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.port_number_db}"]
  }
}



resource "google_compute_firewall" "javaapp" {
  name    = "tcp-8080"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["${var.port_number_javaapp}"]
  }
}
