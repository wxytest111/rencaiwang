#!/bin/bash

set -e

ssh root@115.28.9.176 /bin/bash << EOF
cd /opt/works/rencaiwang
git co .
git pr
bundle install
sh scripts/restart-server.sh
EOF
