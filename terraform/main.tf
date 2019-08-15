
// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  region      = "${var.mregions[var.vregion]}"
  #  zone        = var.zone
}
/*
terraform {
  backend "gcs" {
    bucket = "ben_manual"
    //    bucket = "${google_storage_bucket.tf_state.name}"
    //    prefix = "state-file-project-ben"
  }
}
*/

module "net3" {
  source = "./modules/network3/"
  //mregions              = var.mregions
  //vregion               = var.vregion
  //mregion_ip_cidr_range = var.mregion_ip_cidr_range
  //ip_cidr_range_2       = var.mnet_ip_cidr_range["public"]
  // mnet_ip_cidr_range = var.mnet_ip_cidr_range
  lnet_ip_cidr_range = var.lnet_ip_cidr_range
  lnet               = var.lnet
}

/*
module "vms3" {
  source = "./modules/vms3/"
  ################## official recomendation instead of the using "depends_on" in modules
  lsubnet_name   = "${module.net3.subnets}"
  vms_count      = "${var.vms_count}"
  vregion        = var.vregion
  instances_name = "${var.instances_name}"
  image          = var.mimage[var.mregions[var.vregion]]
  ###  mdisk_size     = "${var.mdisk_size}"
  ###  mzones         = "${var.mzones}"
  ###  mregions       = "${var.mregions}"
  zone               = "${lookup(var.mzones, "${var.mregions[var.vregion]}")}"
  size               = var.mdisk_size[var.mregions[var.vregion]]
  mnet_ip_cidr_range = var.mnet_ip_cidr_range
}
*/

/*
resource "google_storage_bucket" "tf_state" {
  name     = "ben_tf_state"
  location = "EU"

  ######
  force_destroy = true
}
*/




