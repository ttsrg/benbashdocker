

variable "mregions" {
  type = "map"
default = {}              
              }
              
              variable "mzones" {
                type = "map"
                  default = {}
                            }

variable "mdisk_size" {
  type = "map"
      default = {
              region-0 = "13"
                          region-1 = "14"
                                        }
                                                      }
variable "lsubnet_name" {
      default = {}
      }

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
  default = "vm30"
}



variable "vms_count" {
      default = "1"
      }

variable "zone" {
  default = "us-central1-a"
}


variable "zones" {
  //  default = "europe-west1-b"
//    type    = "list"
      //default = ["europe-west1-b", "europe-west6-c"]
//      default = ["northamerica-northeast1-a","northamerica-northeast1-b"]
default = []
      }

variable "region" {
  default = "us-central1"
}



variable "machine_type" {
  default = "f1-micro"
  #  default = "g1-small"
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