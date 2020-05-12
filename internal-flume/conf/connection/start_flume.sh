#!/bin/sh

BASE_DIR=$(cd $(dirname $0); pwd)

nohup ${BASE_DIR}/dae_f2k.sh >/dev/null 2>&1 &
