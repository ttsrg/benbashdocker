#!/bin/bash
#./exp1.sh -jv=8 -av=10 -n=benpostgre -i=ben/postgre -f=postgreUbuntuDocfile  -v=ben_postgre_sql --network=gerrit-net -v=ben_postgre_etc -v=ben_postgre_log

#set -x
[[ -z "$@" ]] && echo "no args, please use nexts:" \
    && echo -e "\033[37;1;44m ./startstack.sh -option1 ..  -optionN \033[0m" \
    && echo -e "-jv xx - java version"\
    && echo "-av xx - application version" \
    && exit 1

# define array of volumes
VOLS=()


for i in "$@"
do

    case $i in
	-jv=*|--java_version=*)
	JAVA_VERSION="${i#*=}"
	echo "RPEFIX= $PREFIX";;
    
	-av=*|--app_version=*)
        APP_VERSION="${i#*=}";;
    
        -i=*|--image=*)
	CONTAINER_IMAGE="${i#*=}" ;;
    
        -n=*|--name=*)
	CONTAINER_NAME="${i#*=}" ;;
            
        -n=*|--network=*)
        DOCKER_NETWORK="${i#*=}" ;;

        -f=*|--docfile=*)
        DOC_FILE="${i#*=}" ;;
        
        -v=*|--volume=*)
        DOCKER_VOLUME="${i#*=}"
	VOLS+=($DOCKER_VOLUME)  ;;

        *)
           echo "wrong parameters" && exit 1 
           ;;
	###  add help        
	        
    esac
done

echo "all variables  $@"
echo "count of variables = $#"

echo JAVA_VERSION = $JAVA_VERSION
echo APP_VERSION = ${APP_VERSION}
echo CONTAINER_IMAGE = $CONTAINER_IMAGE
echo CONTAINER_NAME = $CONTAINER_NAME
echo "VOLUMS= ${VOLS[@]}"
echo "DOCKER_NETWORK = $DOCKER_NETWORK"

exit 0
