terraform fmt 
terraform fmt modules/network3/
terraform fmt modules/vms3/
terraform init
#terraform plan



### apply using file terraform.tfvars
echo "yes" | terraform apply
terraform output > .out1.txt
###terraform output > ".out1_$(date)"
#-var-file="variables.tf"



export GOOGLE_APPLICATION_CREDENTIALS=~/.gcloud/terraform.json
cp -f state2backet state2backet.tf
echo "yes" |terraform init


echo "#################"
echo -e "\033[37;1;33m    deploy vms in another region \033[0m"
echo "##############"
terraform apply     -auto-approve   -var 'vregion=region-0' -var 'vms_count=2'

terraform output > .out2.txt



##echo -e "\033[37;1;33m destroy  \033[0m"

##rm -f state2backet.tf
##echo "yes" | terraform init

##terraform destroy -force

##sleep 3
##terraform destroy -force
### non-interactive calling
### echo "yes" | terraform apply -var-file="starter.tfvars"