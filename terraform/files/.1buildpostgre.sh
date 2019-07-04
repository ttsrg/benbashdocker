#!/bin/bash

#define variables

$(pwd)/buildparser.sh     -ci=ttserg/postgre -av=10  -cu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=reviewdb  -f=postgreUbuntuDocfile 

#-dn=gerrit-net  \
#-v=/var/lib/postgresql -v=/etc/postgresql -v=/var/log/postgresql/ \
#-cn=benpostgre


