# bendocker
Creating stack nginx/postgre/java_app using terraform and ansible-playbook


## Usage
```bash

1 Script 'builddockerimages.sh'   builds images locally,  have to change variables "dockerhubname=ttserg" and 
"dockerhubpass" via symbol link

2 Script 'startstack.sh' runs containers on google-compute-instance(centos 7), have to  use GCP's ssh-key and put it to ~/.ssh/gcloud_id_rsa 
 if it necessary have to change "dockerhubrepo" 
```



>Also  may  start commands manual for example:
* > export ANSIBLE_STDOUT_CALLBACK=debug   " - useful stdout of ansible"
* > ansible-playbook   builddockerimages.yml 
* > ansible-playbook   builddockerimages.yml -l localhost  --tags=gerritbuild -vvv  # "- (tags and verbose level)"
* > ansible-playbook   -u devops --key-file "~/.ssh/gcloud_id_rsa" runcontainers.yml  -i stage


**After deploy  APP will be available at output of terraform = ext_nat_ip  - "bash echo $(terraform output | grep -w ext_nat_ip|awk '{print $3}')"


used 
docker version 18.09.6
ansible 2.8




PS terracoreos/ - in progress