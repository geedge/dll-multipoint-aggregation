#!/bin/sh

#DAE_NAME=dae_k2ha.sh
#JAR_NAME=k2ha.properties
BASE_DIR=$(cd $(dirname $0); pwd)

DAE_NAME=`ls ${BASE_DIR} | grep ^dae_* | grep .sh$`
JAR_NAME=`ls ${BASE_DIR} | grep f2k\* | grep .properties$`

NUM1=`ps -ef | grep ${DAE_NAME} | grep -v grep | wc -l`
pids1=$(ps -ef | grep ${DAE_NAME} | grep -v grep | awk '{print $2}')
if [ "${NUM1}" -ge "1" ];then
    for pid1 in $pids1
    do
     kill -9  $pid1
     echo 'killed '${DAE_NAME}' process-->'$pid1
    done
fi

for jar in $JAR_NAME ; do

NUM2=`ps -ef | grep $jar | grep -v grep | wc -l`
pids2=$(ps -ef | grep $jar | grep -v grep | awk '{print $2}')
if [ "${NUM2}" -ge "1" ];then
    for pid2 in $pids2
    do
     kill -9  $pid2
     echo 'killed '${JAR_NAME}' process-->'$pid2
    done
fi
done
