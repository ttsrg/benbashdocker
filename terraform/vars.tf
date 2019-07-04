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

variable "instance_name_docker" {
  description = "The name of instance"
  default = "docker"
 }

variable "script_path" {
  type        = "string"
    description = "Where is the path to the script locally on the machine?"
 default = ".scr.sh"
 }

variable "machine_type" {
#default = "f1-micro"
default = "g1-small"
}


variable "machine_type_docker" {
default = "f1-micro"
#default = "g1-small"
}



variable "port_number" {
default = "80"
}


variable "image_docker" {
#default = "debian-cloud/debian-9"
default = "cos-cloud/cos-stable"
}


variable "image" {
default = "debian-cloud/debian-9"
}


variable "docker_declaration" {
  type = "string"
# Change the image: string to match the docker image you want to use
  default = "spec:\n  containers:\n    - name: test-docker\n      image: 'tomcat'\n      stdin: false\n      tty: false\n  restartPolicy: Always\n"
 }
# gcr.io/stackdriver-agents/stackdriver-logging-agent:0.2-1.5.33-1-1

/*
variable "docker_declaration2" {
  type = "string"
  # Change the image: string to match the docker image you want to use
    default = "spec:\n  containers:\n    - name: test-docker2\n      image: 'nginx'\n      stdin: false\n     "
 }
*/

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
