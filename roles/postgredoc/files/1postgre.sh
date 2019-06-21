#!/bin/bash

#define variables

#set +x
#-dbu=postgres
source parser.sh     -ci=ben/postgre -av=10  -cu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=reviewdb  -f=postgreUbuntuDocfile \
-dn=gerrit-net  \
-v=/var/lib/postgresql -v=/etc/postgresql -v=/var/log/postgresql/ \
-cn=benpostgre

#-v ben_postgre_sql:/var/lib/postgresql -v ben_postgre_etc:/etc/postgresql -v ben_postgre_log:/var/log/postgresql  --network=gerrit-net 
#--name=$CONTAINER_NAME  $CONTAINER_IMAGE:$POSTGRE_VER

exit 0