


output "external_ip1" {
  value = "${google_compute_instance.vm1.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ip1" {
  value = "${google_compute_instance.vm1.network_interface.0.network_ip}"
}



output "external_ip2" {
  value = "${google_compute_instance.vm2.network_interface.0.access_config.0.nat_ip}"
  }
  
  output "internal_ip2" {
    value = "${google_compute_instance.vm2.network_interface.0.network_ip}"
    }