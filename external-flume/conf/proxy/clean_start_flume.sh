#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)
DAE_NAME=`ls ${BASE_DIR} | grep ^dae_* | grep .sh$`


#清除日志和checkpoint以及历史data
rm -rf ${BASE_DIR}/logs/*

nohup ${BASE_DIR}/${DAE_NAME} $1 $2 >/dev/null 2>&1 &
