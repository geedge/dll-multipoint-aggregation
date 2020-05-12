#! /bin/bash

#flume配置文件夹路径,注意最后没有/
BASE_DIR=$(cd $(dirname $0); cd ../conf/; pwd)

from_lv=INFO,LOGFILE
to_lv=WARN,LOGFILE

#from_lv=WARN,LOGFILE
#to_lv=INFO,LOGFILE

for conf_name in `ls ${BASE_DIR}`
do

# sed -i 's/flume.root.logger=INFO,LOGFILE/flume.root.logger=WARN,LOGFILE/' ${BASE_DIR}/${conf_name}/log4j.properties
 sed -i 's/flume.root.logger='${from_lv}'/flume.root.logger='${to_lv}'/' ${BASE_DIR}/${conf_name}/log4j.properties

done
