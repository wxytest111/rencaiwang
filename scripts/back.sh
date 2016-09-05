#!/bin/bash

set -e

#env=$1

now=$(date +%Y%m%d%H)

echo "$now"

path=/opt/backup/$now
if [ ! -d $path ]; then
  mkdir -p $path
fi

mysqldump -h$RCW_HOST -u$RCW_USER -p$RCW_PWD $RCW_DB > $path/rencaiwang.sql

