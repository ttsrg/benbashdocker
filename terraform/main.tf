# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
}



// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = "${var.project_name}"
  region      = "${var.region}"
}

module "vm1" {
  source        = "./modules/vms/"
  instance_name = "${var.instance_name}"
  image_size    = 11
}



module "vm2" {
  source        = "./modules/vms/"
  instance_name = "vm2"
  image_size    = "12"
}


