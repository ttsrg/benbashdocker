terraform fmt 
terraform fmt modules/network3/
terraform fmt modules/vms3/
export GOOGLE_APPLICATION_CREDENTIALS=~/.gcloud/terraform.json
 terraform init
###terraform plan



### apply using file terraform.tfvars
echo "yes" | terraform apply 
terraform output > .out1.txt


#read -p " Press [Enter] key to continue..."



echo "#################"
echo -e "\033[37;1;33m    deploy vms in another region \033[0m"
echo "##############"
###terraform apply     -auto-approve   -var 'vregion=region-0' -var 'vms_count=3'
###terraform output > .out2.txt



##echo -e "\033[37;1;33m destroy  \033[0m"

##rm -f state2backet.tf
##echo "yes" | terraform init

##terraform destroy -force

