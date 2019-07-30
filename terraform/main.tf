# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
}



// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  region      = "${var.region}"
  zone = var.zone
}



/*
module "net" {
  source = "./modules/network/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
  }
  */


module "vm1" {
  source = "./modules/vms/"
  #  instance_name = "${var.instance_name}"
  instance_name = "vm1"
  image_size    = 11
  zone = "${var.zone}"
#  subnetwork = "${module.net.subnet_name}"
   
    
}

/*
module "vm2" {
  source        = "./modules/vms/"
  instance_name = "vm2"
  image_size    = "12"
  #  network = module.net.bennetwork
}
*/


