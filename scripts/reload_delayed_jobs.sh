#!/bin/bash

set -e
/opt/works/zaotai_admin_oil/bin/delayed_job stop
/opt/works/zaotai_admin_oil/bin/delayed_job -n 2 start