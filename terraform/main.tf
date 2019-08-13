
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

  instances_name = "${var.instances_name}"
}
/*
resource "google_storage_bucket" "tf_state" {
  name     = "ben_tf_state"
  location = "EU"
}

//export GOOGLE_APPLICATION_CREDENTIALS=~/.gcloud/terraform.json...
// in 2 steps, but depens_on and variables don't work here
terraform {
  backend "gcs" {
    bucket = "ben_tf_state"
    //    bucket = "${google_storage_bucket.tf_state.name}"
    prefix = "state-file-project-ben"
  }
}

*/

/*
module "lb" {
  # When using these modules in your own templates, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "github.com/gruntwork-io/terraform-google-load-balancer.git//modules/network-load-balancer?ref=v0.2.0"
  source = "./modules/lbnet"

  name    = var.namelb
  region  = var.lregions
  project = var.project_name

  enable_health_check = true
  health_check_port   = "5000"
  health_check_path   = "/api"

  firewall_target_tags = [var.namelb]
  //  instances= var.instances
  //  instances = [google_compute_instance.self_link]
  instances = "${module.vms3.google_compute_instance_self_link}"
  ###                          custom_labels = var.custom_labels
}
*/



