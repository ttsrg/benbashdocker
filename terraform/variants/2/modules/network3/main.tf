resource "google_compute_network" "vpc3" {
  name                    = "a3-virtual-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet3" {
  ##  name                     = "subnetwork3-private-${count.index}"
  name = "subnetwork3-private-${var.vregion}"
  ###name                     = "subnetwork3-private
  //  ip_cidr_range            = "192.168.168.0/24"
  //  ip_cidr_range            = "${lookup(var.region_ip_cidr_range,{element(var.vm_region[count.index])})}"
  ##  count = "${length(var.mregions)}"
  //count =1
  ##  region    = "${lookup(var.mregions, "region-${count.index}")}"
  ##   region    = "${lookup(var.mregions, "${var.vregion}")}"
  region = var.mregions[var.vregion]

  ##   ip_cidr_range                = "${lookup(var.mregion_ip_cidr_range, "region-${count.index}")}"
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
