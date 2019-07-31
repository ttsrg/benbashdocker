variable "subnet_self_link" {
  //default = "module.net2.subnet_self_link"
  default = "subnetwork2-private"

}



variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "project_name" {
  description = "The ID of the Google Cloud project"
  default     = "gerritben"
}





### count = "${var.count}"

variable "instance_name" {
  description = "The name of instance"
  default     = "default_instance"
}


variable "script_path" {
  type        = "string"
  description = "Where is the path to the script locally on the machine?"
  default     = ".scr.sh"
}

variable "machine_type" {
  default = "f1-micro"
  #  default = "g1-small"
}

variable "image_size" {
  default = 10
}





#variable "port_number" {
#  default = "80"
#}

variable "ip_cidr_range" {
  default = "10.100.0.0/16"
}

variable "image_docker" {
  #default = "debian-cloud/debian-9"
  default = "cos-cloud/cos-stable"
}


variable "image" {
  description = "image for default stack"
  # default = "debian-cloud/debian-9"
  default = "centos-cloud/centos-7"
  #default = "cos-cloud/cos-stable"

}


variable "docker_declaration" {
  type = "string"
  # Change the image: string to match the docker image you want to use
  default = "spec:\n  containers:\n    - name: test-docker\n      image: 'tomcat'\n      stdin: false\n      tty: false\n  restartPolicy: Always\n"
}
# gcr.io/stackdriver-agents/stackdriver-logging-agent:0.2-1.5.33-1-1


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
