#! /bin/bash

#flume配置文件夹路径,注意最后没有/
#主路径下
#BASE_DIR=$(cd $(dirname $0); cd conf/; pwd)
#flumeController路径下
BASE_DIR=$(cd $(dirname $0); cd ../conf/; pwd)


for conf_name in `ls ${BASE_DIR}`
do
 cd ${BASE_DIR}/${conf_name} && ./start_flume.sh

done
