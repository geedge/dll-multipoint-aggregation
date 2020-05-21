#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)
DAE_FILE=$(cd $(dirname $0); ls | grep dae*)
nohup ${BASE_DIR}/$DAE_FILE >/dev/null 2>&1 &
