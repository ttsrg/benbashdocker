
export ANSIBLE_STDOUT_CALLBACK=debug
#ansible-playbook -i stage -l local buildcontainers.yml --tags=postgrebuild -vvv
#ansible-playbook -i stage -u devops --key-file ~/.ssh/gcloud_id_rsa runcontainers.yml --tags=dockerinstall
ansible-playbook -i stage -u devops --key-file ~/.ssh/gcloud_id_rsa runcontainers.yml --skip-tags=dockerinstall 
#--tags=postgrerun -vvv