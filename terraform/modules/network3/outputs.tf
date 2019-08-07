/*
output vpc_self_link {
  value = "${google_compute_network.vpc.self_link}"
}


output vpc_name {
  value = "${google_compute_network.vpc.name}"
}
*/



output subnet_self_link {
  value = "${google_compute_subnetwork.subnet3.self_link}"
}

output subnet_name {
  value = "${google_compute_subnetwork.subnet3.name}"
}

output gateway_address {
  value = "${google_compute_subnetwork.subnet3.gateway_address}"
}
