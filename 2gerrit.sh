#!/bin/bash

#define variables

#set +x

# if  container postgre starts
source parser.sh     -ci=ben/gerritben -jv=1.8.0 -cu=gerrit -av=3.0.0 -f=gerritCentosDocfile \
#-dn=gerrit-net  \
-v=/home/gerrit/gerrit/git -v=/home/gerrit/gerrit/index -v=/home/gerrit/gerrit/cache -v=/home/gerrit/gerrit/etc   \
-cn=bengerrit


#docker build -t $CONTAINER_IMAGE:$APP_VER  --build-arg POSTGRE_VER=$APP_VER --build-arg DB_USER=$DB_USER \
#--build-arg DBS_USER=$DBS_USER --build-arg DBS_USER_PASS=$DBS_USER_PASS  --build-arg DBS_DB=$DBS_DB  -f $DOC_FILE .
