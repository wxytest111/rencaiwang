#!/bin/bash

set -e

folder=$1

cd db_backup

tar -xvf $folder.tar

cd ..

mysql -h$RCW_HOST -u$RCW_USER -p$RCW_PWD $RCW_DB < db_backup/$folder/rencaiwang.sql
