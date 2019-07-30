resource "google_compute_network" "ben_network" {
  name                    = "bennetwork"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "ben_int_subnetwork" {
  name          = "ben-int-subnetwork"
  ip_cidr_range = "10.10.0.0/16"
  #  region        = "us-central1"
  network = "${google_compute_network.ben_network.self_link}"
  //  secondary_ip_range {
  //    range_name    = "tf-test-secondary-range-update1"
  //    ip_cidr_range = "192.168.10.0/24"
  //  }
}

output network_self_link {
  value = "${google_compute_network.ben_network.self_link}"
}


/*
output gateway_address {
  value="${google_compute_network.ben_network.gateway_address}"
}
*/