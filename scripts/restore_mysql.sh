#!/bin/bash

echo "restoring database from backup"
source "/home/dominik/kesslerstrasse43/.env"
infile="/home/dominik/kesslerstrasse43/mysql-backup/backup.sql"

if [[ ! -f "$infile" ]]; then
   echo file not found $infile
   exit 1
fi

docker exec -i mysql sh -c "exec mysql -uroot -p$K43_ROOT_DB_PASSWORD" < "$infile"
