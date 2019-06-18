#!/bin/bash


source ./exp1.sh     -ci=ben/postgre -av=10 -dbu=postgres -dbsu=gerrit -dbsup=gerrit -dbsdb=reviewdb -f=postgreUbuntuDocfile
source buildpostgre.sh