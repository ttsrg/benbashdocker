
###count....
output "ext_ip_vm1" {
  value = "${module.vm1.external_ip}"
}
output "int_ip_vm1" {
  value = "${module.vm1.internal_ip}"
}


/*
output "ext_ip_vm2" {
  value = "${module.vm2.external_ip}"
}

output "int_ip_vm2" {
  value = "${module.vm2.internal_ip}"
}
*/        