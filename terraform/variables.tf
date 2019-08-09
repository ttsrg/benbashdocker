

variable "mdisk_size" {
  type = "map"
  default = {
    region-0 = "10"
    region-1 = "11"
  }
}
variable "mregion_ip_cidr_range" {
  type = "map"
  default = {
    region-0 = "10.10.10.0/24"
    region-1 = "192.168.168.0/24"
  }
}


variable "mregions" {
  type = "map"
  default = {
    region-0 = "europe-west1"
    region-1 = "us-central1"
  }
}


variable "mzones" {
  type = "map"
  default = {
    region-0 = "europe-west1-c"
    region-1 = "us-central1-f"
  }
}



variable "regions" {
  type    = "list"
  default = ["europe-west1", "europe-west6"]
}

variable "zones" {
  //  default = "europe-west1-b"
  type    = "list"
  default = ["europe-west1-b", "europe-west6-c"]
}




variable "region" {
  default = "asia-east1"
}

variable "zone" {
  //default = "europe-west1-b"
  default = "us-west2-c"

}


variable "project_name" {
  description = "The ID of the Google Cloud project"
  default     = "gerritben"
}






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