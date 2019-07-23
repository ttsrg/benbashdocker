// Terraform plugin for creating random ids
#resource "random_id" "instance_id" {
# byte_length = 8
#}

// A single Google Cloud Engine instance
resource "google_compute_instance" "stack" {
//###"${var.google_compute_instance}" 
### count = "${var.count}"
 metadata = {
            ssh-keys = "${var.sshuser}:${file("${var.public_key_path}")}"
 }
 name         = "${var.instance_name}"
 machine_type = "${var.machine_type}"
 zone         = "${var.region_zone}"
 tags =  ["stack"]
 ###["${var.tags}"]

 boot_disk {
   initialize_params {
     image = "${var.image}"
   }
 }

// Make sure soft  are installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"

 network_interface {
   network = "default"
   access_config {
     // Include this section to give the VM an external ip address
   }
 }


#provisioner "local-exec" {
#    command = "echo !!!!!!!!!!!!!!!!! >> qqq.txt"
#      }
      
      
/*
provisioner "local-exec" {

    inline = [
      "sudo curl -sSL https://get.docker.com/ | sh",
            "sudo usermod -aG docker `echo $USER`",
                  "sudo docker run -d -p 80:80 nginx"
                      ]
                        }
*/

provisioner "file" {
  source      = "test.txt"
    destination = "~/test.txt"
    
   connection {
      host = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
         type        = "ssh"
            user        = "${var.sshuser}"
               private_key = "${file("${var.private_key_path}")}"
                  agent       = false
                      }
}
/*
provisioner "remote-exec" {


   inline = [
   "sudo curl -sSL https://get.docker.com/ | sh",
   "sudo usermod -aG docker `echo $USER`",
   "sudo docker run -d -p 80:80 nginx"
          ]
   connection  {
   host = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
   type        = "ssh"
   user        = "${var.sshuser}"
   private_key = "${file("${var.private_key_path}")}"
   agent       = false
    }
    }
*/
  
  

#  service_account {
#      scopes = ["https://www.googleapis.com/auth/compute.readonly"]
#        }

  


}
#output "ip" {
#       value = "${google_compute_instance.stack.public_ip}"
#               }

###output "${var.instance_name}.ip" {

output "nat_ip" {
 value = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ip" {
 value = "${google_compute_instance.stack.network_interface.0.network_ip}"
 }
 