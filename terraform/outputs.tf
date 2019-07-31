###count....
output "ext_ip_vm1" {
  value = "${module.vms.external_ip1}"
}
output "int_ip_vm1" {
  value = "${module.vms.internal_ip1}"
}



output "ext_ip_vm2" {
  value = "${module.vms.external_ip1}"
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