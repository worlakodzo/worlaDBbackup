#! /bin/bash
destination="/var/www/backup_db/liteapp/" 


cd "/var/www/backup_db/worlaDBbackup"
bash mysql.sh $LITEAPP_DB_NAME $destination $LITEAPP_DB_HOST $LITEAPP_DB_USER $LITEAPP_DB_PASSWORD $LITEAPP_DB_PORT