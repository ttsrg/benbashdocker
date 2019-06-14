#!/bin/bash
#start all scripts in next sequence:
#1startpostgre.sh  
#2startgerrit.sh  
#3startnginx.sh 

#./1startpostgre.sh && sleep 2 && ./2startgerrit.sh && ./3startnginx.sh  && \
#echo -e "\033[37;1;32m Please wait until services start \033[0m" && docker ps | grep ben/ && \
#docker volume ls | grep ben_ && docker images | grep ben/ &&\
#sleep 25 && curl localhost || echo -en "\033[33;1;31m  ERROR, you should find a problem \033[0m"



[[ -z "$@" ]] && echo "no args, please use nexts:" \
&& echo -e "\033[37;1;44m ./startstack.sh -option1 ..  -optionN \033[0m" \
&& echo -e "-jv xx - java version"\
&& printf "-av xx - application version" \
 && exit1
count=1
while [[ -n "$1" ]]
do
echo "param №$count= $1"
    case "$1" in
	-av) APP_VER=${OPTARG} &&  echo "options av = $APP_VER";;
	*) echo "!!! no options";;
    esac
let "count++"
shift
done
