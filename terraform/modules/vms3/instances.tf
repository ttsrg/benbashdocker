
// A single Google Cloud Engine instance
resource "google_compute_instance" "vm_333additional" {
###  count =2
  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }

  name         = "${var.instances_name}"
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
    subnetwork = "${var.subnet_name}"
  }
}


