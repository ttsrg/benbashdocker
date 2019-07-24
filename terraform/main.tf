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
  source = "./modules/vms/"
  #  instance_name = "${var.instance_name}"
  instance_name = "vm1"
  image_size    = 11
}


module "vm2" {
  source        = "./modules/vms/"
  instance_name = "vm2"
  image_size    = "12"
}


#output "test"  {}

###count    
output "ext_ip_vm1" {
  value = "${module.vm1.external_ip}"
}
output "int_ip_vm1" {
  value = "${module.vm1.internal_ip}"
}



output "ext_ip_vm2" {
  value = "${module.vm2.external_ip}"
}

output "int_ip_vm2" {
  value = "${module.vm2.internal_ip}"
}
          