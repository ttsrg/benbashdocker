
// A single Google Cloud Engine instance
resource "google_compute_instance" "vm_3" {
  count = "${var.vms_count}"

  ### metadata = {
  ###    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  ###  }


  name         = "${var.instances_name}-${count.index}"
  machine_type = "${var.machine_type}"
  ### zone = "${lookup(var.mzones, "${var.mregions[var.vregion]}")}"
  zone = var.zone
  boot_disk {
    initialize_params {
      image = var.image


      ############# it is same
      ### size = "${var.mdisk_size["${var.mregions[var.vregion]}"]}"
      ### size = var.mdisk_size[var.mregions[var.vregion]]
      size = var.size
    }
  }


  network_interface {
    subnetwork = "${element(var.lsubnet_name, "0")}"

    ###    access_config {
    //           Include this section to give the VM an external ip address
    ###    }

  }
}


