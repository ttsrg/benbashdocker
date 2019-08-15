resource "google_compute_network" "vpc3" {
  name                    = "a3-virtual-network"
  auto_create_subnetworks = false
}


/*

resource "google_compute_subnetwork" "subnet3" {
  for_each      = var.mnet_ip_cidr_range
  name          = "subnetwork3-${each.key}"
  ip_cidr_range = each.value


  //                count = "${length(var.mnet_ip_cidr_range)}"
  //  count = "${length(var.lnet)}"
  //                    name          = "subnet-${element(var.lnet, count.index)}"
  // ip_cidr_range = "${lookup(var.mnet_ip_cidr_range, "${element(var.lnet, count.index)}")}"

  private_ip_google_access = true
  network                  = "${google_compute_network.vpc3.self_link}"

}

*/

resource "google_compute_subnetwork" "subnet3" {
  //  for_each = var.mnet_ip_cidr_range
  //  name     = "subnetwork3-${each.key}"
  // name = "test123"
  //  region = var.mregions[var.vregion]
  //  ip_cidr_range = "${lookup(var.mregion_ip_cidr_range, "${var.mregions[var.vregion]}")}"
  //    ip_cidr_range = each.value
  //ip_cidr_range = "${lookup(var.mnet_ip_cidr_range, "${each.key}")}"


  //count = "${length(var.lnet_ip_cidr_range)}"
  count = "1"
  //  count = "${length(var.lnet)}"
  name          = "subnet-${element(var.lnet, count.index)}"
  ip_cidr_range = "${element(var.lnet_ip_cidr_range, count.index)}"
  //  name                     = "test123"
  //ip_cidr_range            = "10.10.3.0/29"
  private_ip_google_access = true
  network                  = "${google_compute_network.vpc3.self_link}"


}



output subnets {
  //value = "${google_compute_subnetwork.subnet3.*.db.name}"
  value = "${google_compute_subnetwork.subnet3}"

}









/*
resource "google_compute_subnetwork" "subnet3" {
  name = "subnetwork3-private-${var.vregion}"
  //  region        = var.mregions[var.vregion]
  ip_cidr_range = "${lookup(var.mregion_ip_cidr_range, "${var.mregions[var.vregion]}")}"

  private_ip_google_access = true
  network                  = "${google_compute_network.vpc3.self_link}"

}

*/

/*
resource "google_compute_subnetwork" "subnet2" {
  name          = "subnetwork2-private-${var.vregion}"
//  region        = var.mregions[var.vregion]
  ip_cidr_range = var.ip_cidr_range_2
  //"172.16.0.0/24"
  //"${lookup(var.mregion_ip_cidr_range, "${var.mregions[var.vregion]}")}"

  private_ip_google_access = true
  network                  = "${google_compute_network.vpc3.self_link}"

}
*/

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
