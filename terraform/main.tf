
// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  region      = "${var.region}"
  zone        = var.zone
}



locals {
  region_ids    = ["region-1", "region-2", "region-3"]
  name_regions  = ["us-central1", "asia-northeast2", "europe-west3"]
  ip_cidr_range = ["10", "192", "172"]
  disks_size    = ["11", "12", "13"]
}


resource "null_resource" "regions" {
  count = "${length(local.region_ids)}"

  triggers = {
    region_id     = "${element(local.region_ids, count.index)}"
    name_region   = "${element(local.name_regions, count.index)}"
    disk_size     = "${element(local.disks_size, count.index)}"
    ip_cidr_range = "${element(local.ip_cidr_range, count.index)}"
  }
}

output "regions" {
  value = "${null_resource.regions.*.triggers}"
}

output "regions_disk_size" {
  value = "${null_resource.regions.2.triggers.disk_size}"
}


module "net3" {
  source = "./modules/network3/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
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
  disk_size = "${var.disk_size}"
  zone      = "${var.zone}"
  //  zone = "${lookup(var.zones,var.foo)}"
  //  subnet_self_link = "${module.net2.subnet_self_link}"
  //subnet_self_link = "${var.subnet_self_link}"
  ###  subnet_name = "${var.subnetwork3_name}"
  ################## official workaround instead of the will-realised "depends_on" in modules
  //  subnet_name    = "${module.net3.subnet_name}"
  vms_count      = "${var.vms_count}"
  instances_name = "${var.instances_name}"
}





output image_size {
  value = "${lookup(var.disk_size, "region-1")}"

}