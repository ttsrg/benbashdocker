# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
  }
  
// A single Google Cloud Engine instance
resource "google_compute_instance" "docker" {
//###"${var.google_compute_instance}" 
### count = "${var.count}"
//metadata_startup_script = "docker ps"

 metadata = {
            ssh-keys = "${var.sshuser}:${file("${var.public_key_path}")}"
#            "gce-container-declaration" = "${module.gce-container.metadata_value}"
            # gce-container-declaration = "${var.docker_declaration}"
#              gce-container-declaration = "${var.docker_declaration2}"

/*
gce-container-declaration = <<CONTAINER
spec:
  containers:
  - name: test-2
    image: 'tomcat'
    stdin: false
    tty: false
    restartPolicy: Always
                  
CONTAINER
*/
 }
 
 
 name         = "${var.instance_name_docker}"
 machine_type = "${var.machine_type_docker}"
 zone         = "${var.region_zone}"
 tags =  ["stack"]
 ###["${var.tags}"]

 boot_disk {
   initialize_params {
     image = var.image_docker
#     size = "13"
   }
 }


/*
provisioner "local-exec" {
  command = "$(pwd)/files/1buildpostgre.sh -ci=ttserg/postgre -av=10  -cu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=reviewdb  -f=files/postgreUbuntuDocfile "
  interpreter = ["/bin/bash", "-c"]
  }
*/


// Make sure soft  are installed on all new instances for later steps
# metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync"

 network_interface {
   network = "default"
   access_config {
     // Include this section to give the VM an external ip address
#     nat_ip = google_compute_address.static.address
   }
 }

  provisioner "file" {
     source      = ".scr.sh"
         destination = "/tmp/script.sh"
         
         
       connection {
         type        = "ssh"
         host        = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
         #google_compute_address.static.address
         user        = "devops"
         private_key = "${file("${var.private_key_path}")}"
         agent       = false
       }

  }
           
/*           
     provisioner "remote-exec" {
         inline = [
           "chmod +x /tmp/script.sh",
                     "/tmp/script.sh",
         ]
     connection {
        type        = "ssh"
        host        = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
        user        = "devops"
        private_key = "${file("${var.private_key_path}")}"
        agent       = false
     }                                                                      


    }
*/
                                             
                                   
#Because AWS instance needs some time to be ready for usage we will use below trick with remote-exec. 
#As per documentation remote-exec waits for successful connection and only after this runs command.
#  connect to our instance via Terraform and remotely executes our script using SSH
/*  provisioner "remote-exec" {
  inline = [ "sudo  -s","echo $(id) $(pwd) > /tmp/qqqcreds.txt" ]
#      script = ".scr.sh"
      
          connection {
            type        = "ssh"
            host        = "${google_compute_instance.stack.network_interface.0.access_config.0.nat_ip}"
                      #google_compute_address.static.address
            user        = "devops"
            private_key = "${file("${var.private_key_path}")}"
            agent       = false
          }
                    
#     inline = [
#       "sudo curl -sSL https://get.docker.com/ | sh",
#       "sudo usermod -aG docker `echo $USER`",
#       "docker run -d -p 80:80 nginx"
#	"echo $(id) $(pwd) > /tmp/qqqcreds.txt "
#	"echo UYYUTJGJHHG"
#      ]
        
        }
*/

}
#output "ip" {
#       value = "${google_compute_instance.stack.public_ip}"
#               }

###output "${var.instance_name}.ip" {

output "ext_nat_ip_docker" {
 value = "${google_compute_instance.docker.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ip_docker" {
 value = "${google_compute_instance.docker.network_interface.0.network_ip}"
 }

  
