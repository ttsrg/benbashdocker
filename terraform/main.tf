# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
}



// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  region      = "${var.region}"
  zone        = var.zone
}

/*
##################################
module "net" {
  source = "./modules/network/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
}
*/

module "vms" {
  source = "./modules/vms/"
  #  instance_name = "${var.instance_name}"
  #            instance_name = "vm2"
  image_size = 14
  zone       = "${var.zone}"
}


/*
module "vm1" {
  source = "./modules/vms/"
  #  instance_name = "${var.instance_name}"
  instance_name = "vm1"
  image_size    = 11
  zone = "${var.zone}"
//   google_compute_instance.vm.network_interface.subnetwork =  "${module.net.subnet_self_link}"
//  network_interface =  "${module.net.subnet_self_link}"
//  subnetwork =  "${module.net.subnet_self_link}"
  
}



module "vm2" {
  source = "./modules/vms/"
    #  instance_name = "${var.instance_name}"
      instance_name = "vm2"
        image_size    = 14
          zone = "${var.zone}"
}          

*/


//output "root_subnet_self_link" {
// value = "${module.vms.module.netvm.subnet_self_link}"
//}
