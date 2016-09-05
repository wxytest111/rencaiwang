#!/bin/bash

set -e

ssh root@114.215.151.240 /bin/bash << EOF
cd /opt/works/rencaiwang
git co .
git pr
bundle install
sh scripts/restart-server.sh
EOF
