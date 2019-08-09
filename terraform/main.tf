
// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  region      = "${var.region}"
  zone        = var.zone
}






module "net3" {
  source = "./modules/network3/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
  mregions              = var.mregions
  mregion_ip_cidr_range = var.mregion_ip_cidr_range
}



module "vms3" {
  //  count      = "length(${var.vms_count})"
  source = "./modules/vms3/"
  //  disk_size = "${lookup("${null_resource.regions.2.triggers}", "${null_resource.regions.2.triggers.disk_size}")}"
  //  disk_size = "${null_resource.regions.2.triggers.disk_size}"
  // disk_size = {
  //  "${null_resource.regions.2.triggers.region_id}"
  //  "${null_resource.regions.2.triggers.disk_size}"
  // }
  mdisk_size = "${var.mdisk_size}"
  mzones     = "${var.mzones}"
  //  zone = "${lookup(var.zones,var.foo)}"
  //  subnet_self_link = "${module.net2.subnet_self_link}"
  //subnet_self_link = "${var.subnet_self_link}"
  ###  subnet_name = "${var.subnetwork3_name}"
  ################## official workaround instead of the will-realised "depends_on" in modules
  msubnet_name   = "${module.net3.subnet_name}"
  vms_count      = "${var.vms_count}"
  instances_name = "${var.instances_name}"
}





output image_size {
  value = "${lookup(var.mdisk_size, "region-1")}"

}