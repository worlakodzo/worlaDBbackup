#! /bin/bash
destination="/var/www/backup_db/hubs/"


cd "/var/www/backup_db/worlaDBbackup"
bash mysql.sh $_87HUBS_DB_NAME $destination $_87HUBS_DB_HOST $_87HUBS_DB_USER $_87HUBS_DB_PASSWORD $_87HUBS_DB_PORT