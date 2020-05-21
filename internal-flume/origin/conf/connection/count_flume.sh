#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)

JAR_NAME=`ls ${BASE_DIR} | grep f2k* | grep .properties$`

NUM1=`ps -ef | grep ${JAR_NAME} | grep -v grep | wc -l`
pids1=$(ps -ef | grep ${JAR_NAME} | grep -v grep | awk '{print $2}')
echo 'flume '${JAR_NAME}' total process-->'${NUM1}
if [ "${NUM1}" -ge "5" ];then
    for pid1 in $pids1
    do
     echo 'flume '${JAR_NAME}' process-->'$pid1
    done
fi
