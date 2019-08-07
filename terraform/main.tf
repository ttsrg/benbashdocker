
// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("${var.credentials_file_path}")}"
  project     = var.project_name
  region      = "${var.region}"
  zone        = var.zone
}

##################################
/*
module "net2" {
  source = "./modules/network2/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
}
*/

module "net3" {
  source = "./modules/network3/"
  #  region      = "${var.region}"
  #  ip_cidr_range = var.ip_cidr_range
}


/*
module "vms" {
  source = "./modules/vms/"
  #  instance_name = "${var.instance_name}"
  #            instance_name = "vm2"
  image_size = 14
  zone       = "${var.zone}"
}
*/

/*
module "vms2" {
  source     = "./modules/vms2/"
  image_size = 11
  zone       = "${var.zone}"
  //  subnet_self_link = "${module.net2.subnet_self_link}"
  //subnet_self_link = "${var.subnet_self_link}"
  subnet_name = "${var.subnetwork_name}"
}
*/

module "vms3" {
  source     = "./modules/vms3/"
  image_size = 11
  zone       = "${var.zone}"
  //  subnet_self_link = "${module.net2.subnet_self_link}"
  //subnet_self_link = "${var.subnet_self_link}"
  ###  subnet_name = "${var.subnetwork3_name}"
  subnet_name = "${module.net3.subnet_name}"
}
