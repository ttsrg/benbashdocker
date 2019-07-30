terraform fmt 
terraform fmt modules/
terraform init
#terraform plan
terraform apply   -var-file="vm1.tfvars"   -auto-approve  
#-var-file="variables.tf"


### non-interactive calling
### echo "yes" | terraform apply -var-file="starter.tfvars"
