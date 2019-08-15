output "google_compute_instance_self_link" {
  value = "${google_compute_instance.vm_3.*.self_link}"
}

output "internal_ip" {
  value = "${google_compute_instance.vm_3.*.network_interface.0.network_ip}"
}

output "vm_name" {
  value = "${google_compute_instance.vm_3.*.name}"
}


output "disk" {
  ############## HOW I must  find it?
  value = "${google_compute_instance.vm_3.*.boot_disk.0.initialize_params.0.size}"
  //  value = "${google_compute_instance.vm_3.*.boot_disk.0.persistent-disk-0.size}"

}
//persistent-disk-0