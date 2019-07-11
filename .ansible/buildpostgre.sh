export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i inventory/stage -l local build.yml --tags=postgredoc -vvv
#--tags=nexus
