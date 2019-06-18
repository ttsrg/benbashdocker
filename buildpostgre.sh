#!/bin/bash

docker build -t $CONTAINER_IMAGE:$APP_VER  --build-arg POSTGRE_VER=$APP_VER --build-arg DB_USER=$DB_USER \
--build-arg DBS_USER=$DBS_USER --build-arg DBS_USER_PASS=$DBS_USER_PASS  --build-arg DBS_DB=$DBS_DB  -f $DOC_FILE .