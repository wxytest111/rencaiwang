#!/bin/bash

echo 'stop rencaiwang'

set -e

if [ -f /var/run/rencaiwang.pid ]; then
  pid=`cat /var/run/rencaiwang.pid`
  echo $pid
    if [ -d /proc/$pid ]; then
      kill -9 $pid
    fi
fi