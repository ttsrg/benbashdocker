variable "region" {
  default = "us-west1"
}

variable "region_zone" {
  default = "us-west1-a"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
  default = "gerritben"
 }



variable  "google_compute_instance" {
  default = "stack"
}


variable  "gci" {
  default = "stack123"
  }
  

### count = "${var.count}"

variable "instance_name" {
  description = "The name of instance"
  default = "gerrit"
 }


variable "machine_type" {
default = "f1-micro"
}


variable "image" {
default = "debian-cloud/debian-9"
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
