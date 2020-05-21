#! /bin/bash

#flume配置文件夹路径,注意最后没有/
BASE_DIR=$(cd $(dirname $0); cd ../conf/; pwd)

for conf_name in `ls ${BASE_DIR}`
do

# rm -rf ${BASE_DIR}/${conf_name}/logs-*/*.log*
 rm -rf ${BASE_DIR}/${conf_name}/logs/*.log*

 rm -rf ${BASE_DIR}/${conf_name}/restart_log/*.log*

 rm -rf ${BASE_DIR}/${conf_name}/checkpoint/*

 rm -rf ${BASE_DIR}/${conf_name}/data/*
 
done
