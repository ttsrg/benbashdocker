#!/bin/bash

#define variables

#set +x

# if  container postgre starts
source parser.sh    -dn=gerrit-net -ci=ben/gerritben -jv=1.8.0  -cu=gerrit -av=3.0.0 -f=gerritCentosDocfile \
-v=/home/gerrit/gerrit/git -v=/home/gerrit/gerrit/index -v=/home/gerrit/gerrit/cache \
 --volume=/home/gerrit/gerrit/etc  -cn=bengerrit 
