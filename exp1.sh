#!/bin/bash

#set -x
[[ -z "$@" ]] && echo "no args, please use nexts:" \
    && echo -e "\033[37;1;44m ./startstack.sh -option1 ..  -optionN \033[0m" \
        && echo -e "-jv xx - java version"\
            && printf "-av xx - application version" \
                && exit1
count=1
c=1
volume=()
vol=()


echo "all variables  $@"
echo "count of variables = $#"


for i in "$@"
do

case $i in
    -p=*|--prefix=*)
    PREFIX="${i#*=}"
    echo "RPEFIX= $PREFIX"
    ;;
    -s=*|--searchpath=*)
    SEARCHPATH="${i#*=}"
    ;;
    -l=*|--lib=*)
    DIR="${i#*=}"
    ;;
    -v=*|--volume=*)
    VOLUME="${i#*=}"
#    while [[ -n "$1" ]] 
#    do
#    echo VOLUME = $VOLUME
#    shift 
#    done


#for param in $i
#do
echo "Parameter #$count: $param $c"
count=$(( $count + 1 ))
let "c++" 
echo VOLUME = $VOLUME
#done
 while (( "$#" >= 2 )); do
       volume+=( "$1" )
       echo "volume=== $volume"
             shift
                 done

echo "vol1= ${vol[@]}"

vol+=($VOLUME) 
echo "vol2= ${vol[@]}"

    ;;
    --default)
    DEFAULT=YES
    ;;
    *)
            # unknown option
    ;;
esac
done

echo PREFIX = ${PREFIX}
echo SEARCH PATH = ${SEARCHPATH}
echo DIRS = ${DIR}
echo DEFAULT = ${DEFAULT}
echo VOLUME = $VOLUME
echo volume =${volume[@]}
echo "all variables  $@"
echo "count of variables = $#"
echo "vol= ${vol[@]}"

exit 0
