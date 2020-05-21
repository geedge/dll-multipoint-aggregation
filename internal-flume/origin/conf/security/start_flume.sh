#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)

nohup ${BASE_DIR}/dae_security.sh >/dev/null 2>&1 &
