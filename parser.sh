#!/bin/bash
#./exp1.sh -jv=8 -av=10 -n=benpostgre -i=ben/postgre -f=postgreUbuntuDocfile  -v=ben_postgre_sql --network=gerrit-net -v=ben_postgre_etc -v=ben_postgre_log \
#-dbsdb==reviewdb

 #./exp1.sh     -ci=ben/postgre -av=10 -dbu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=reviewdb -f=postgreUbuntuDocfile
 

#set -x
[[ -z "$@" ]] && echo "no args, please use nexts:" \
    && echo -e "\033[37;1;44m ./startstack.sh -option1 ..  -optionN \033[0m" \
    && echo -e "-jv xx - java version"\
    && echo "-av xx - application version" \
    && exit 1

# define arrays
VOLUME=()
BUILD_ARG=()
VOLLOCAL=()
VOLALL=()


for i in "$@"
do

    case $i in
	-jv=*|--java_version=*)
	JAVA_VER="${i#*=}";;
    
	-av=*|--app_version=*)
        APP_VER="${i#*=}";;

	-ba=*|--build-arg=*)
	BUILD_ARG+=(${i#*=}) ;;

        -ci=*|--container_image=*)
	CONTAINER_IMAGE=${i#*=} ;;

        -cn=*|--container_name=*)
        CONTAINER_NAME=${i#*=}
        [[ ! -z "$CONTAINER_NAME" ]] && echo CONTAINER_NAME = $CONTAINER_NAME
        
         ;;
                

        -cu=*|--container_user=*)
        CONTAINER_USER=${i#*=} ;;
# user for postgre/mysql and etc - feature
        -dbu=*|--data_base_user=*)
        DB_USER="${i#*=}" ;;

# service user for app
        -dbsu=*|--data_base_service_user=*)
        DBS_USER="${i#*=}" ;;
                
        -dbsup=*|--data_base_service_user_pass=*)
        DBS_USER_PASS="${i#*=}" ;;
        
        -dbsdb=*|--data_base_service_db=*)
        DBS_DB="${i#*=}" ;;
                        
                        
        -f=*|--docfile=*)
        DOC_FILE="${i#*=}" ;;
    
        -dn=*|--docker_network=*)
        DOCKER_NETWORK="${i#*=}" ;;

### PORT_EXPOSE

	-p=*|--port=*)
	PORT_FORWARD+="${i#*=}" ;;
	
        -v*|--volume=*)
        DOCKER_VOLUME="${i#*=}"
	VOLUME+=($DOCKER_VOLUME)
	[[ ! -z "$DOCKER_VOLUME" ]] && echo DOCKER_VOLUME = $DOCKER_VOLUME
	
	  ;;

        *)
           echo "wrong parameters" && exit 1
           ;;
	###  add help        
	        
    esac
done

echo "all variables  $@"
echo "count of variables = $#"

[[ ! -z "$JAVA_VERSION" ]] && echo JAVA_VERSION = $JAVA_VERSION
#[[ $JAVA_VERSION !== "" ]] && echo JAVA_VERSION = $JAVA_VERSION
### all variables need  add
[[ ! -z "$APP_VER" ]] && echo APP_VER = ${APP_VER}
[[ ! -z "$CONTAINER_IMAGE" ]] && echo CONTAINER_IMAGE= $CONTAINER_IMAGE
[[ ! -z "$CONTAINER_NAME" ]] && echo CONTAINER_NAME = $CONTAINER_NAME
[[ ! -z "$CONTAINER_USER" ]] && echo CONTAINER_USER = $CONTAINER_USER
[[ ! -z "$DB_USER" ]] && echo DB_USER=$DB_USER
[[ ! -z "$DBS_USER" ]] && echo DBS_USER=$DBS_USER
[[ ! -z "$DBS_USER_PASS" ]] && echo DBS_USER_PASS=$DBS_USER_PASS
[[ ! -z "$DBS_DB" ]] && echo DBS_DB=$DBS_DB
[[ ! -z "${VOLUME[@]}" ]] && echo "VOLUME(s) = ${VOLUME[@]}"


#---====build containers=====-----
###docker build -t $CONTAINER_IMAGE:$APP_VER  ${BUILD_ARG[@]}  -f $DOC_FILE .
#docker build -t $CONTAINER_IMAGE:$APP_VER  --build-arg CONTAINER_USER=$CONTAINER_USER --build-arg JAVA_VER=$JAVA_VER \
#--build-arg APP_VER=$APP_VER --build-arg POSTGRE_VER=$APP_VER  \
#--build-arg DBS_USER=$DBS_USER --build-arg DBS_USER_PASS=$DBS_USER_PASS  --build-arg DBS_DB=$DBS_DB   -f $DOC_FILE .

#--build-arg DB_USER=$DB_USER 
[[ $? -ne 0 ]] &&   echo -e "\e[94m !!!!!BUILD ERROR \033[0m" && exit 1


#---====start containers=====-----

echo  -e "\n\e[92m DOCKER NETWORK \033[0m"
docker network ls | grep $DOCKER_NETWORK; [[ $? -ne 0 ]] &&  docker network create $DOCKER_NETWORK &&  echo -e "\033[37;1;44m  docker network has created \033[0m"


echo  -e "\n\e[92m DOCKER VOLUME(s)  \033[0m"
#echo "Array size: ${#VOLUME[*]}"
###for VOLS in ${VOLUME[@]}
for i in ${!VOLUME[*]}
do
    #may use "sed"
    VOLTEMP=${VOLUME[$i]/#\/} && VOLTEMP=${VOLTEMP/%\/} &&  VOLLOCAL+=(${VOLTEMP//\//-})
    docker volume ls | grep -w ${VOLLOCAL[$i]}; [[ $? -ne 0 ]] &&  docker volume create ${VOLLOCAL[$i]} && echo -e "\033[37;1;34m created volume  \033[0m"
    VOLALL+=( -v ${VOLLOCAL[$i]}:${VOLUME[$i]} )
#((i++))
#echo i=$i
done

docker ps -a  | grep -w $CONTAINER_NAME &>/dev/null; [[ $? -eq 0 ]] && echo  -e "\n\e[92m same name container was removed   \033[0m" && docker rm -f $CONTAINER_NAME

echo  -e "\n\e[92m DOCKER VOLUME(s) ${VOLALL[@]} \033[0m"
echo  -e "\n\e[97m  $DOCKER_NETWORK   $CONTAINER_NAME   $CONTAINER_IMAGE:$APP_VER  \033[0m"
docker run   -d  ${VOLALL[@]} ${PORT[@]} --network=$DOCKER_NETWORK --name=$CONTAINER_NAME  $CONTAINER_IMAGE:$APP_VER
#--restart=always
docker ps



# exit 0