terraform fmt 
terraform fmt modules/network/
terraform init
#terraform plan
terraform apply      -auto-approve  
#-var-file="variables.tf"


### non-interactive calling
### echo "yes" | terraform apply -var-file="starter.tfvars"
