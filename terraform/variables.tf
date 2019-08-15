
variable mnet_ip_cidr_range {
  default = {}
}

variable lnet_ip_cidr_range {
  default = []
}



variable "instances_name" {
  default = ""
}

variable "vms_count" {
  default = ""
}


variable "mdisk_size" {
  type    = "map"
  default = {}
}


variable "lnet" {
  default = []
}


variable "mregion_ip_cidr_range" {
  type    = "map"
  default = {}
}


variable "vregion" {
  default = ""
}


variable "mregions" {
  default = {
  }
}


variable "mzones" {
  type = "map"
  default = {
  }
}



variable "mimage" {
  type = "map"
  default = {
  }
}





variable "project_name" {
  description = "The ID of the Google Cloud project"
  default     = ""
}





variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = ""
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