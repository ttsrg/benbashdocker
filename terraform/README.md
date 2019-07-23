#TERRAFORM practice

 

# TASKS
```bash
Terraform code should have :
   1. Virtual network
      2. Subnets
         3. Security groups
            4.  Load balancer in Public network
               5. VMs in PRivate network
                  6. Virtual network + Subnets + SG in folder network, LB in folder lb,  2 VMs in vms folder with different names and disk size
                     7. In common file should call of all 3 modules
                        8. variables file should be specified
                           9  All the resources should have outputs and attached to report
                              10. state file should be not local
```



>Also  may  start commands manual for example:
* > terraform apply
* > terraform apply -var-file="gcp.tfvars"
* > terraform taint -module=salt_master aws_instance.salt_master  # The taint command can be used to taint specific resources within a module
**After deploy  APP will be available at output of terraform = ext_nat_ip  - "bash echo $(terraform output | grep -w ext_nat_ip|awk '{print $3}')"


> destroy
* > terraform destroy




