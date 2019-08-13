terraform fmt 
terraform fmt modules/network/
terraform init
#terraform plan
echo "yes" | terraform apply      
terraform output > out1
#-var-file="variables.tf"
echo "############################ deploy vms in another region ############"
sleep 3
terraform apply     -auto-approve   -var 'vregion=region-0' -var 'vms_count=2'
terraform output > out0


echo "----======destroy====-----"
sleep 3
terraform destroy -force
### non-interactive calling
### echo "yes" | terraform apply -var-file="starter.tfvars"
