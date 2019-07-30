


// A single Google Cloud Engine instance
resource "google_compute_instance" "vm" {


  metadata = {
    ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
  }



  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"
  zone         = var.zone
  tags         = ["stack"]
  ###["${var.tags}"]

  boot_disk {
    initialize_params {
      image = var.image
      #      size  = var.image_size
      size = "${var.image_size}"

    }
  }


  #  network_interface = module.net.

  network_interface {
    //  network = "default"
    #    network = "module.vm1.module.netvm.google_compute_network.ben_network.name"
//    network = "module.net.vpc_self_link"
    //   network = google_compute_network.ben_network.name
    subnetwork = "${module.netvm.subnet_self_link}"

    access_config {
      // Include this section to give the VM an external ip address
      #     nat_ip = google_compute_address.static.address
    }
  }

}

/*
output "external_ipold" {
  value = "${google_compute_instance.vm.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ipold" {
  value = "${google_compute_instance.vm.network_interface.0.network_ip}"
}
*/

module "netvm" {
  source = "../network/"
  #  ip_cidr_range = var.ip_cidr_range
}



/*
resource "google_compute_network" "ben_network" {
  name                    = "ben-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "ben_int_subnetwork" {
  name          = "ben-int-subnetwork"
  ip_cidr_range = "10.10.0.0/16"
  #  region        = "us-central1"
  network = "${google_compute_network.ben_network.self_link}"
  //  secondary_ip_range {
  //    range_name    = "tf-test-secondary-range-update1"
  //    ip_cidr_range = "192.168.10.0/24"
  //  }
}
*/


/*
output network_self_link {
  value = "${google_compute_network.ben_network.self_link}"
}



                      output gateway_address {
                        value="${google_compute_network.ben_network.gateway_address}"
                        }
                        */
                        