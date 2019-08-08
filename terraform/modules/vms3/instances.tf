
// A single Google Cloud Engine instance
resource "google_compute_instance" "vm_3" {
  count = "${var.vms_count}"
  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }

  
  name         = "${var.instances_name}-${count.index}"
  machine_type = "${var.machine_type}"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      #      size  = var.image_size
//      size = "${var.disk_size}"

//  size = "${lookup(var.disk_size, "region-${count.index}")}"
############### need check if count > 2
  size = "${lookup(var.disk_size, "region-${count.index >= 2 ? 0 : count.index }")}"

    }
  }


  ################
  network_interface {
    network    = "${var.subnet_name == "" ? var.network_name : ""}"
    subnetwork = "${var.subnet_name}"
###    access_config {
      //           Include this section to give the VM an external ip address
###    }

  }
}


