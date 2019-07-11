export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i inventory/stage -l doc3 playbook.yml --tags=gerritdoc 
