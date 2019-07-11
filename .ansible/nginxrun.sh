export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i inventory/stage -l local gerrit.yml --tags=nginxrun -vvv
#--tags=nexus
