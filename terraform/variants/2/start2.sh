terraform fmt
terraform plan
terraform apply   -var-file="vm2.tfvars"   -auto-approve  
#-var-file="variables.tf"


### non-interactive calling
### echo "yes" | terraform apply -var-file="starter.tfvars"