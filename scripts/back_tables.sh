#!/usr/bin/env bash#!/bin/bash

set -e

now=$(date +%Y%m%d%H)

echo "$now"

path=/Users/wangxinyu/Desktop/$now
if [ ! -d $path ]; then
  mkdir -p $path
fi

tables=(activities admins advertisements batches carts categories categories_suppliers check_codes cities config_vouchers customers customer_behaviors customers_utags daily_accounts districts favorites feedbacks franchises gas_distributions gas_points gas_stations items job_schedules labels labels_raws message_queues performances purchases raws raw_prices raw_versions relations relation_histories roles schema_migrations scores sessions stock_snapshots stocks streets suppliers table_histories utags vehicles versions vouchers wallet_histories wallets wechat_users wx_tickets wx_tokens)

for table in "${tables[@]}"
do
  echo ${table}
  mysqldump -h$ZT_DB_HOST -u$ZT_DB_USER -p$ZT_DB_PASSWORD $ZT_DB_NAME ${table} > $path/${table}.sql
done
