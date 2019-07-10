terraform apply -auto-approve
EXT_IP_STACK=$(terraform output | grep -w ext_nat_ip|awk '{print $3}')
echo "[stack]">stage
echo $EXT_IP_STACK >> stage

#"${i#*=}";

export ANSIBLE_STDOUT_CALLBACK=debug
#ansible-playbook -i stage -l local buildcontainers.yml --tags=postgrebuild -vvv
ansible-playbook -i stage -u devops --key-file ~/.ssh/gcloud_id_rsa runcontainers.yml 
# --tags=dockerinstall
#ansible-playbook -i stage -u devops --key-file ~/.ssh/gcloud_id_rsa runcontainers.yml --skip-tags=dockerinstall
#--tags=postgrerun -vvv 
