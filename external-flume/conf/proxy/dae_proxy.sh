#!/bin/sh

#JAR_NAME=ktk_ip_asn.properties
PROPERTIES_NAME=proxy_k2f
#flume进程名称
FLUME_NAME=proxy
#flume根目录
BASE_DIR=$(cd $(dirname $0); cd ../../; pwd)
#当前路径
CONF_DIR=$(cd $(dirname $0); pwd)
#进程总数
PROCESS_SUM=1

echo "##############################################################" >> ${CONF_DIR}/restart_log/restart_${PROPERTIES_NAME}.log
id=0 #配置文件后面的序号，无特殊作用
flag=0 # flag为0表示初始化状态，为1表示完整启动成功所有进程，为2表示进程意外停止之后又重新杀死其余的进程并重新启动所有进程
while true ; do
    NUM=`ps -ef | grep ${PROPERTIES_NAME} | grep -v grep | grep -v dae |wc -l`
    pids=$(ps -ef | grep ${PROPERTIES_NAME}\* | grep properties  | awk '{print $2}')
    time_stamp=$(date +%Y%m%d%H%M%S)
    #大于设置进程数,杀掉所有进程,重启
    if [[ "${NUM}" -ne ${PROCESS_SUM} && $flag -eq "1" ]];then
        for pid in $pids
        do
         kill -9  $pid
        done
      flag=2  
    #如果正在运行的进程数小于定义的进程数，就启动    
    elif [ "${NUM}" -lt ${PROCESS_SUM} ];then
    id=$(( ( ($id) % $PROCESS_SUM ) + 1 ))
        nohup ${BASE_DIR}/bin/flume-ng agent -n ${FLUME_NAME} -c ${CONF_DIR} -f ${CONF_DIR}/${PROPERTIES_NAME}.properties  >/dev/null 2>&1 &
    echo "${time_stamp} ---> the ${PROPERTIES_NAME}_APP restart ---> $id" >> ${CONF_DIR}/restart_log/restart_${PROPERTIES_NAME}.log
    #进程数如果等于指定的进程数，那就设置flag为1 id为0
    elif [ "${NUM}" -eq ${PROCESS_SUM} ];then
        flag=1
        id=0
    fi
        sleep 10
done
