# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
  }

####dependencies  
# depends_on =[ google_compute_instance.db.gce-container-declaration ]
  
// A single Google Cloud Engine instance
resource "google_compute_instance" "javaapp" {
### count = "${var.count}"

    
metadata = {
  ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
#            "gce-container-declaration" = "${module.gce-container.metadata_value}"
#       gce-container-declaration = "${var.docker_declaration}"
#              gce-container-declaration = "${var.docker_declaration2}"



### only ONE container runs in metadata

gce-container-declaration = <<CONTAINER
spec:
  containers:
  - name: gerrit
    image: 'ttserg/gerrit:3.0.0'
    stdin: false
    tty: false
    restartPolicy: Always
                  
CONTAINER
}
 
 
 
 name         = "${var.instance_name_javaapp}"
 machine_type = "${var.machine_type_docker}"
 zone         = "${var.region_zone}"
 tags =  ["stack"]
 ###["${var.tags}"]

 boot_disk {
   initialize_params {
     image = var.image_docker
   }
 }


 network_interface {
   network = "default"
   access_config {
     // Include this section to give the VM an external ip address
#     nat_ip = google_compute_address.static.address
   }
 }

}


#output "ip" {
#       value = "${google_compute_instance.stack.public_ip}"
#               }

###output "${var.instance_name}.ip" {

output "ext_nat_ip_javaapp" {
 value = "${google_compute_instance.javaapp.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ip_javaapp" {
 value = "${google_compute_instance.javaapp.network_interface.0.network_ip}"
 }

