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

# define array of volumes
VOLUME=()


for i in "$@"
do

    case $i in
	-jv=*|--java_version=*)
	JAVA_VER="${i#*=}";;
    
	-av=*|--app_version=*)
        APP_VER="${i#*=}";;



        -ci=*|--container_image=*)
	CONTAINER_IMAGE=${i#*=} ;;

        -cn=*|--container_name=*)
        CONTAINER_NAME=${i#*=} ;;
                

# user for postgre/mysql and etc
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

	-p=*|--port=*)
	FORWARD_PORT="${i#*=}"
	PORT+=($FORWARD_PORT) ;;        
	
        -v=*|--volume=*)
        DOCKER_VOLUME="${i#*=}"
	VOLUME+=($DOCKER_VOLUME)  ;;

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

[[ ! -z "$DB_USER" ]] && echo DB_USER=$DB_USER
[[ ! -z "$DBS_USER" ]] && echo DBS_USER=$DBS_USER
[[ ! -z "$DBS_USER_PASS" ]] && echo DBS_USER_PASS=$DBS_USER_PASS
[[ ! -z "$DBS_DB" ]] && echo DBS_DB=$DBS_DB

echo "VOLUME= ${VOLUME[@]}"
echo "DOCKER_NETWORK = $DOCKER_NETWORK"

#docker build -t $CONTAINER_IMAGE:$APP_VER --build-arg APP_VER=$APP_VER -f $DOC_FILE .
#may reDefine variables
#./buildpostgre.sh
#source buildpostgre.sh
#docker build -t $CONTAINER_IMAGE:$APP_VER  --build-arg POSTGRE_VER=$APP_VER --build-arg DB_USER=$DB_USER \
#--build-arg DBS_USER=$DBS_USER --build-arg DBS_USER_PASS=$DBS_USER_PASS  --build-arg DBS_DB=$DBS_DB  -f $DOC_FILE .

#docker build -t ben/postgre:10  --build-arg POSTGRE_VER=10 --build-arg DB_USER=postgres -f postgreUbuntuDocfile .





# exit 0
