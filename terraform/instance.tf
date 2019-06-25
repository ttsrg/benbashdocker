// Terraform plugin for creating random ids
#resource "random_id" "instance_id" {
# byte_length = 8
#}

// A single Google Cloud Engine instance
resource "google_compute_instance" "stack" {
 metadata = {
            ssh-keys = "googleuser:${file("~/.ssh/id_rsa.pub")}"
 }
 name         = "gerrit-stack"
 machine_type = "f1-micro"
 zone         = "us-west1-a"


 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }


}

#output "ip" {
#       value = "${google_compute_instance.stack.public_ip}"
#               }

output "ip" {
 value = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
}
