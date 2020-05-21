#! /bin/bash

#监控相关路径,不以/结尾
BASE_DIR=$(cd $(dirname $0); pwd)
CONFNAMES=$(cd $(dirname $0); cd ../conf/; pwd)
lastMinTime=$(date +"20%y%m%d%H%M" -d "-2 min")

echo "###############################$lastMinTime######################################"
echo $BASE_DIR
echo $CONFNAMES

for conf_name in `cat $BASE_DIR/flumeConfList`
do
    echo $conf_name
    echo $lastMinTime
    min_msgSuccessSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $14}' | awk '{sum+=$1}END{print sum}'`
    echo min_msgSuccessSum=$min_msgSuccessSum
    min_msgFailedSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $16}' | awk '{sum+=$1}END{print sum}'`
    echo min_msgFailedSum=$min_msgFailedSum
    min_msgReadyPostSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $18}' | awk '{sum+=$1}END{print sum}'`
    echo min_msgReadyPostSum=$min_msgReadyPostSum
    min_msgTotalSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $20}' | awk '{sum+=$1}END{print sum}'`
    echo min_msgTotalSum=$min_msgTotalSum
    #min_fileSuccessSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $20}' | awk '{sum+=$1}END{print sum}'`
    #echo min_fileSuccessSum=$min_fileSuccessSum
    #min_fileReadyPostSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $22}' | awk '{sum+=$1}END{print sum}'`
    #echo min_fileReadyPostSum=$min_fileReadyPostSum
    #min_fileBytesSuccessSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $24}' | awk '{sum+=$1}END{print sum}'`
    #echo min_fileBytesSuccessSum=$min_fileBytesSuccessSum
    #min_fileBytesReadyPostSum=`cat $CONFNAMES/$conf_name/logs/flume.log | grep 'last min' | grep "$lastMinTime" | awk '{print $26}' | awk '{sum+=$1}END{print sum}'`
    #echo min_fileBytesReadyPostSum=$min_fileBytesReadyPostSum

    #curl -s -XPOST 'http://127.0.0.1:8086/write?db=telegraf&u=admin&p=telegraf' --data-binary 'Cap_File_Monitor,flumeTask='$conf_name',statType=OneMinMonitor,LogStatTime='$lastMinTime' MsgSuccessSum='$min_msgSuccessSum',MsgFailedSum='$min_msgFailedSum',MsgReadyPostSum='$min_msgReadyPostSum',FileSuccessSum='$min_fileSuccessSum',FileReadyPostSum='$min_fileReadyPostSum',FileBytesSuccessSum='$min_fileBytesSuccessSum',FileBytesReadyPostSum='$min_fileBytesReadyPostSum''
    curl -s -XPOST 'http://127.0.0.1:8086/write?db=telegraf&u=admin&p=telegraf' --data-binary 'Cap_File_Monitor,flumeTask='$conf_name',statType=OneMinMonitor,LogStatTime='$lastMinTime' MsgSuccessSum='$min_msgSuccessSum',MsgFailedSum='$min_msgFailedSum',MsgReadyPostSum='$min_msgReadyPostSum',MsgTotalSum='$min_msgTotalSum''
echo $conf_name---$lastMinTime---
done
