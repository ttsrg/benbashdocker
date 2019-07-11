export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i inventory/stage -l local build.yml --tags=nginxrun -vvv
#--tags=nexus
