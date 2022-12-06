#!/bin/bash

echo "backing up database"
source "/home/dominik/kesslerstrasse43/.env"
outdir="/home/dominik/kesslerstrasse43/mysql-backup"
outfile="/home/dominik/kesslerstrasse43/mysql-backup/backup.sql"

if [[ ! -d "$outdir" ]]; then
   mkdir $outdir -pv
fi
docker exec mysql sh -c "exec mysqldump --all-databases -uroot -p$K43_ROOT_DB_PASSWORD" > "$outfile"