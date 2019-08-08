
#####################
variable "subnet_name" {
  //default = "${module.net2.subnet_self_link}"
  //  default = "subnetwork3-private"
  default = ""
}

variable "network_name" {
  default = "default"
}


variable "instances_name" {
  //type = list(string)
  default = "vm31"
}


variable "zone" {
  default = "europe-west1-b"
}

variable "region" {
  default = "europe-west1"
}



variable "machine_type" {
  default = "f1-micro"
  #  default = "g1-small"
}

variable "image_size" {
  default = "13"
}



variable "image" {
  description = "image for default stack"
  # default = "debian-cloud/debian-9"
  default = "centos-cloud/centos-7"
  #default = "cos-cloud/cos-stable"

}





variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/terraform.json"
}


variable "sshuser" {
  default = "devops"
}

variable "public_key_path" {
  description = "Path to file containing public key"
  default     = "~/.gcloud/gcloud_id_rsa.pub"
}

variable "private_key_path" {
  description = "Path to file containing private key"
  default     = "~/.gcloud/gcloud_id_rsa"
}