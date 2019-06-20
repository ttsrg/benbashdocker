#!/bin/bash

#define variables

#set +x

# if  container postgre starts
source parser.sh    -dn=gerrit-net -ci=ben/nginx   -av=1.16.0 -f=nginxUbuntuDocfile \
 --volume=/usr/local/nginx/conf/  -cn=bennginx 
 
# -p=(-p 80:80)
#-dn=gerrit-net  

