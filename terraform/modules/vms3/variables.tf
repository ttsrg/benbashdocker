

variable "mregions" {
  default = {}
}

variable "mzones" {
  type    = "map"
  default = {}
}

variable "mdisk_size" {
  type = "map"
  default = {
  }
}

variable "size" {
  default = ""
}


variable mnet_ip_cidr_range {
  default = {}
}

variable "lsubnet_name" {
  default = {}
}

#####################
variable "subnet_name" {
  default = ""
}

variable "network_name" {
  default = ""
}


variable "instances_name" {
  default = ""
}



variable "vms_count" {
  default = ""
}

variable "zone" {
  default = ""
}


variable "zones" {
  default = []
}

variable "vregion" {
  default = ""
}



variable "machine_type" {
  default = "f1-micro"
  #  default = "g1-small"
}



variable "image" {
  default = ""
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