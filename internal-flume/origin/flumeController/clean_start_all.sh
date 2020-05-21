#! /bin/bash

#flume配置文件夹路径,注意最后没有/
#主路径下
#BASE_DIR=$(cd $(dirname $0); cd conf/; pwd)
#flumeController路径下
BASE_DIR=$(cd $(dirname $0); cd ../conf/; pwd)

for conf_name in `ls ${BASE_DIR}`
do
 cd ${BASE_DIR}/${conf_name} && ./clean_start_flume.sh

done

#用于脚本一直前台运行,防止docker自动退出,但本地运行不需要前台,需要注释掉本条指令
tail -f /dev/null
