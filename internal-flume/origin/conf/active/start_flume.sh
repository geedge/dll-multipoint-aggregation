#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)
nohup ${BASE_DIR}/dae_active_denfence.sh >/dev/null 2>&1 &
