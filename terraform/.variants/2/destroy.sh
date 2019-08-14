
export GOOGLE_APPLICATION_CREDENTIALS=~/.gcloud/terraform.json
echo -e "\033[37;1;33m destroy  \033[0m"

rm -f state2backet.tf
echo "yes" | terraform init

terraform destroy -force
