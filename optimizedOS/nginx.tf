# Locks the version of Terraform for this particular use case
terraform {
  required_version = "~>0.12.0"
  }

####dependencies  
# depends_on =[ google_compute_instance.db.gce-container-declaration ]
  
// A single Google Cloud Engine instance
resource "google_compute_instance" "web" {
### count = "${var.count}"
depends_on =[ google_compute_instance.javaapp ]

provisioner "file" {
     source      = "nginx.conf"
     destination = "/home/devops/nginx.conf"


       connection {
         type        = "ssh"
         host        = "${google_compute_instance.web.network_interface.0.access_config.0.nat_ip}"
         #google_compute_address.static.address
         user        = "devops"
         private_key = "${file("${var.private_key_path}")}"
         agent       = false
       }

  }

#metadata_startup_script = "docker run --rm -d tomcat"    
metadata_startup_script = "docker run --rm -d  -v /home/devops/nginx.conf:/usr/local/nginx/conf/nginx.conf ttserg/nginx:1.16.0"
metadata = {
  ssh-keys = "${var.sshuser}:${file(var.public_key_path)}"
#            "gce-container-declaration" = "${module.gce-container.metadata_value}"
#       gce-container-declaration = "${var.docker_declaration}"
#              gce-container-declaration = "${var.docker_declaration2}"


### only ONE container runs in metadata
# gce-container-declaration = "spec:\n  containers:\n    - name: instance-4\n      image: 'tomcat'\n      stdin: false\n    tty: false\n  restartPolicy: Always\n"

/*
gce-container-declaration = <<CONTAINER
spec:
  containers:
  - name: nginx
    image: 'ttserg/nginx:1.16.0'
#    image: 'tomcat'
  volumeMounts:
  - name: vol_nginx
  mountPath: /usr/local/nginx/conf
  readOnly: true
  stdin: false
  tty: false
  restartPolicy: Always
  volumes:
  - name: vol_nginx
  hostPath:
  path: /home/devops
CONTAINER
*/

}


/*    volumeMounts:      
    - name: volume-nginx
      mountPath: /home/devops/
  volumes:
  - name: volume-nginx
    hostPath:
      path: /usr/local/nginx/conf/
*/    
                  
 
/*
provisioner "local-exec" {
  command = "$(pwd)/files/1buildpostgre.sh -ci=ttserg/postgre -av=10  -cu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=
    interpreter = ["/bin/bash", "-c"]
      }
*/      

/*
provisioner "file" {
     source      = "nginx.conf"
     destination = "/tmp/nginx.conf"


       connection {
         type        = "ssh"
         host        = "${google_compute_instance.web.network_interface.0.access_config.0.nat_ip}"
         #google_compute_address.static.address
         user        = "devops"
         private_key = "${file("${var.private_key_path}")}"
         agent       = false
       }

  }
*/





 
 
 name         = "${var.instance_name_web}"
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



output "ext_nat_ip_web" {
 value = "${google_compute_instance.web.network_interface.0.access_config.0.nat_ip}"
}

output "internal_ip_web" {
 value = "${google_compute_instance.web.network_interface.0.network_ip}"
 }


