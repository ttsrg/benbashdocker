export ANSIBLE_STDOUT_CALLBACK=debug
ansible-playbook -i inventory/stage -l doc2 playbook.yml --tags=gerritdoc -vv
#--tags=nexus
