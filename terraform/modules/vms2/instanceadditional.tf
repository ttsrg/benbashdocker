/*
module "netvm" {
  source = "../network/"
  #  ip_cidr_range = var.ip_cidr_range
}
*/


// A single Google Cloud Engine instance
resource "google_compute_instance" "vm_additional" {

  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }

  name         = "vm-additional"
  machine_type = "${var.machine_type}"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      #      size  = var.image_size
      size = "${var.image_size}"

    }
  }

################
  network_interface {
//      network = "default"
    subnetwork = "${var.subnet_name}"
//   subnetwork = subnet2_name
//acccess_config {
      // Include this section to give the VM an external ip address
//    }
  }

}

