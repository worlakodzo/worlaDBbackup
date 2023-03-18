#! /bin/bash
destination="/var/www/backup_db/roofdepot/"

bash mysql.sh $RDL_APP_DB_NAME $destination $RDL_APP_DB_HOST $RDL_APP_DB_USER $RDL_APP_DB_PASSWORD $RDL_APP_DB_PORT