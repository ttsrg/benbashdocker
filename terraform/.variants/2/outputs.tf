
/*

output disk_size {
  value = "${module.vms3.(var.mdisk_size, "region-1")}"
  
  }
  

*/

output "google_compute_instance_self_link" {
  value = "${module.vms3.google_compute_instance_self_link}"
}

output "google_compute_instance_internal_ip" {
  value = "${module.vms3.internal_ip}"
}


output "google_compute_instance_name" {
  value = "${module.vms3.vm_name}"
}


output "google_compute_instance_disk_size" {
  value = "${module.vms3.disk_size}"
}


output "google_compute_instance_disk_image" {
  value = "${module.vms3.disk_image}"
}


output vpc_self_link {
  value = "${module.net3.vpc_self_link}"
}


output subnet3_self_link {
  value = "${module.net3.subnet_self_link}"
}

output subnet3_ip_range {
  value = "${module.net3.subnet_ip_range}"
}


output subnet3_name {
  value = "${module.net3.subnet_name}"
}


output sg_self_link {
  value = "${module.net3.sg_self_link}"
}


output sg_attributes {
  value = "${module.net3.sg_attributes}"
}







/*
output "ext_ip_vm1" {
  value = "${module.vms.external_ip1}"
}
output "int_ip_vm1" {
  value = "${module.vms.internal_ip1}"
}



output "ext_ip_vm2" {
  value = "${module.vms.external_ip2}"
}

output "int_ip_vm2" {
  value = "${module.vms.internal_ip2}"
}


output subnet2_self_link {
  value = "${module.net2.subnet_self_link}"
}

output subnet2_name {
  value = "${module.net2.subnet_name}"
}


*/


/*
output vpc_self_link {
  value = "${module.vms.vpc_self_link}"
}


/*
  output vpc_name {
    value = "${google_compute_network.vpc.name}"
      }
      
      output subnet_self_link {
        value = "${google_compute_subnetwork.subnet.self_link}"
        }
        
        output subnet_name {
          value = "${google_compute_subnetwork.subnet.name}"
          }
          
          output gateway_address 
          
          */