
// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  #  region      = "${var.region}"
  #  zone        = var.zone
}




module "net3" {
  source = "./modules/network3/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
  mregions = var.mregions
  vregion  = var.vregion
  ###vregion = var.mregions[var.vregion]

  mregion_ip_cidr_range = var.mregion_ip_cidr_range
}



module "vms3" {
  source     = "./modules/vms3/"
  mdisk_size = "${var.mdisk_size}"
  mzones     = "${var.mzones}"
  mregions   = "${var.mregions}"
  ################## official recomendation instead of the using "depends_on" in modules
  lsubnet_name = "${module.net3.subnet_name}"
  vms_count    = "${var.vms_count}"
  vregion      = var.vregion
  ###  vregion = "${var.mregions[var.vregion]}"

  instances_name = "${var.instances_name}"
  image          = var.mimage[var.mregions[var.vregion]]
}


resource "google_storage_bucket" "tf_state" {
  name     = "ben_tf_state"
  location = "EU"

  ######
  force_destroy = true
}





