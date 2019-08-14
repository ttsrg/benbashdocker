
// A single Google Cloud Engine instance
resource "google_compute_instance" "vm_3" {
  count = "${var.vms_count}"
  //  count = "${length(var.mregions)}"

  ### metadata = {
  ###    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  ###  }


  name         = "${var.instances_name}-${count.index}"
  machine_type = "${var.machine_type}"
  //  zone         = "${element(var.zones, "${count.index}")}"
  //  zone = "${lookup(var.mzones, "region-${count.index >= 2 ? 0 : count.index}")}"
  zone = "${lookup(var.mzones, "${var.mregions[var.vregion]}")}"
  boot_disk {
    initialize_params {
      image = var.image

      ############### need check if count > 2
      //      size = "${lookup(var.mdisk_size, "region-${count.index >= 2 ? 0 : count.index}")}"
      ###      size = "${lookup(var.mdisk_size, "${var.mregions[var.vregion]}")}"

      ############# it is same
      ### size = "${var.mdisk_size["${var.mregions[var.vregion]}"]}"
      size = var.mdisk_size[var.mregions[var.vregion]]

    }
  }


  ################
  network_interface {
    //    network    = "${var.subnet_name == "" ? var.network_name : ""}"
    //    network = "${element(var.lsubnet_name, "0") == ""  ? var.network_name : ""}"
    ## network = "${lookup(var.msubnet_name, "${var.vregion}") == [] ? var.network_name : ""}"

    ##     network = "default"
    //    subnetwork = "${lookup(var.msubnet_name, "region-${count.index}")}"
    subnetwork = "${element(var.lsubnet_name, "0")}"
    //    subnetwork ="${var.subnet_name}" 

    ###    access_config {
    //           Include this section to give the VM an external ip address
    ###    }

  }
}


