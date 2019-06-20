#!/bin/bash

#define variables

#set +x

# if  container postgre starts
source parser.sh    -dn=gerrit-net -ci=ben/nginx   -av=1.16.0 -f=nginxUbuntuDocfile \
 --volume=/usr/local/nginx/conf/  -cn=bennginx 
 
 # -p=(-p 80:80)
#-dn=gerrit-net  \

#docker build -t $CONTAINER_IMAGE:$APP_VER  --build-arg POSTGRE_VER=$APP_VER --build-arg DB_USER=$DB_USER \
#--build-arg DBS_USER=$DBS_USER --build-arg DBS_USER_PASS=$DBS_USER_PASS  --build-arg DBS_DB=$DBS_DB  -f $DOC_FILE .
