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

variable "instance_name_javaapp" {
  description = "The name of instance"
  default = "gerritdoc"
 }


variable "instance_name_db" {
  description = "The name of instance"
  default = "postgredoc"
     }
     
variable "instance_name_web" {
  description = "The name of instance"
  default = "nginxdoc"
}
     
          

variable "machine_type" {
#default = "f1-micro"
default = "g1-small"
}


variable "machine_type_docker" {
default = "f1-micro"
#default = "g1-small"
}



variable "port_number_web" {
default = "80"
}


variable "port_number_db" {
default = "5432"
}


variable "port_number_javaapp" {
default = "8080"
}

variable "image_docker" {
#default = "debian-cloud/debian-9"
#default = "cos-cloud/cos-stable"
default = "cos-cloud/cos-stable-75-12105-97-0"
}


variable "image" {
 description = "image for default stack"
# default = "debian-cloud/debian-9"
 default = "centos-cloud/centos-7"
#default = "cos-cloud/cos-stable"

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



variable "credentials_file_path" {
  description = "Path to the JSON file used to describe your account credentials"
  default     = "~/.gcloud/terraform.json"
}
    