module "netvm" {
  source = "../network/"
  #  ip_cidr_range = var.ip_cidr_range
}



// A single Google Cloud Engine instance
resource "google_compute_instance" "vm1" {

  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }

  name         = "vm1"
  machine_type = "${var.machine_type}"
  zone         = var.zone
  tags         = ["stack"]

  boot_disk {
    initialize_params {
      image = var.image
      #      size  = var.image_size
      size = "${var.image_size}"

    }
  }


  network_interface {
    //  network = "default"
    subnetwork = "${module.netvm.subnet_self_link}"
    access_config {
      // Include this section to give the VM an external ip address
    }
  }

}

resource "google_compute_instance" "vm2" {


  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }



  name         = "vm2"
  machine_type = "${var.machine_type}"
  zone         = var.zone
  tags         = ["stack"]

  boot_disk {
    initialize_params {
      image = var.image
      #      size  = var.image_size
      size = "${var.image_size}"

    }
  }


  network_interface {
    //  network = "default"
    subnetwork = "${module.netvm.subnet_self_link}"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

}



