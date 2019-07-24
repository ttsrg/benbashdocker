


// A single Google Cloud Engine instance
resource "google_compute_instance" "vm" {


  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }



  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = "${var.region_zone}"
  tags         = ["stack"]
  ###["${var.tags}"]

  boot_disk {
    initialize_params {
      image = var.image
#      size  = var.image_size
      size  = "${var.image_size}"
      
    }
  }


  network_interface {
      network = "default"
//    subnetwork = "$google_compute_subnetwork.ben_int_subnetwork.name"
    access_config {
      // Include this section to give the VM an external ip address
      #     nat_ip = google_compute_address.static.address
    }
  }


}


output "external_ipold" {
  value = "${google_compute_instance.vm.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ipold" {
  value = "${google_compute_instance.vm.network_interface.0.network_ip}"
}

