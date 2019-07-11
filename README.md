# bendocker
Creating stack nginx/postgre/java_app by docker for testing


## Usage
```
Should use ansible=>2.8
```



>Start stack at remote server:
* > RUN startstack.sh
* > or  
* > ansible-playbook -i inventory/stage -l doc3 playbook.yml


**After deploy  APP will  available at - [gerrit](http://doc3)**


```bash
Starts rmALL.sh  at /home/vagrant/ remote host removes all docker settings .
```