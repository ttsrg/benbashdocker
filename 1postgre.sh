#!/bin/bash

#define variables

#set +x
source parser.sh     -ci=ben/postgre -av=10 -cu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=reviewdb -f=postgreUbuntuDocfile \
-dn=gerrit-net  \
-v=/var/lib/postgresql -v=/etc/postgresql -v=/var/log/postgresql/ \
-cn=benpostgre

#${for VOL in ${VOLUME[@]}
#do
#echo -v=$VOL
#done} \

echo !!!!!

#source buildpostgre.sh
[[ ! -z "$DBS_DB" ]] && echo DBS_DB=$DBS_DB

#source parser.sh  -cn=benpostgre -dn=gerrit-net

#[[ ! -z "$DBS_DB" ]] && echo DBS_DB=$DBS_DB

echo  -e "\n\e[92m DOCKER NETWORK \033[0m"
docker network ls | grep $DOCKER_NETWORK ; [[ $? -ne 0 ]] &&  docker network create $DOCKER_NETWORK &&  echo -e "\033[37;1;44m  docker network has created \033[0m"


echo  -e "\n\e[92m DOCKER VOLUME(s)  \033[0m"
VOLLOCAL=()
VOLALL=()
#echo "Array size: ${#VOLUME[*]}"
###for VOLS in ${VOLUME[@]}
for i in ${!VOLUME[*]}
do
    #may use "sed"
    ### many variables!!!!
    VOLTEMP=${VOLUME[$i]/#\/} && VOLTEMP=${VOLTEMP/%\/} &&  VOLLOCAL+=(${VOLTEMP//\//-})
    docker volume ls | grep -w ${VOLLOCAL[$i]}; [[ $? -ne 0 ]] &&  docker volume create ${VOLLOCAL[$i]} && echo -e "\033[37;1;34m created volume  \033[0m"
    #VOLALL[$i]=("-v"+"${VOLUME[$i]}"+"${VOLLOCAL[$i]}"  
    VOLALL+=( -v ${VOLLOCAL[$i]}:${VOLUME[$i]} )
#((i++))
#echo i=$i
done

docker ps -a  | grep -w $CONTAINER_NAME &>/dev/null; [[ $? -eq 0 ]] && echo  -e "\n\e[92m same name container was removed   \033[0m" && docker rm -f $CONTAINER_NAME 
#DOCVOL=( -v ben_postgre_sql:/var/lib/postgresql -v=ben_postgre_etc:/etc/postgresql -p 5555:5432)
###restart
#docker run  -d  -v=ben_postgre_sql:/var/lib/postgresql -v=ben_postgre_etc:/etc/postgresql -v=ben_postgre_log:/var/log/postgresql 

echo  -e "\n\e[92m DOCKER VOLUME(s)  \033[0m"
docker run   -d  ${VOLALL[@]} ${PORT[@]} --network=$DOCKER_NETWORK --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$APP_VER 

#-v ben_postgre_sql:/var/lib/postgresql -v ben_postgre_etc:/etc/postgresql -v ben_postgre_log:/var/log/postgresql  --network=gerrit-net 
#--name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER

