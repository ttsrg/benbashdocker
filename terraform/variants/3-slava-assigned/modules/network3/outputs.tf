
output vpc_self_link {
  value = "${google_compute_network.vpc3.self_link}"
}


output sg_self_link {
  value = "${google_compute_firewall.sg3.self_link}"
}


output sg_name {
  value = "${google_compute_firewall.sg3.name}"
}


output sg_attributes {
  value = "${google_compute_firewall.sg3.*.allow}"
}


/*
output vpc_name {
  value = "${google_compute_network.vpc3.name}"
}
*/



output subnet_self_link {
  value = "${google_compute_subnetwork.subnet3.self_link}"
}

output subnet_name {
  value = "${google_compute_subnetwork.subnet3.*.name}"
}


output subnet_ip_range {
  value = "${google_compute_subnetwork.subnet3.*.ip_cidr_range}"
}

output gateway_address {
  value = "${google_compute_subnetwork.subnet3.*.gateway_address}"
}
