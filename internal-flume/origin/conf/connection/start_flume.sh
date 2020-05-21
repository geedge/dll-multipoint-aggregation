#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)

nohup ${BASE_DIR}/dae_connection.sh >/dev/null 2>&1 &
