#! /bin/bash

database=$1
destination=$2
db_host=$3
db_user=$4
db_password=$5
destination=$6

# Change to backup directory
cd destination

function run_backup(){

    timestamp=$(date +%Y-%m-%d_%H-%M-%S)

    # Backup the database
    mysqldump -h $db_host -u $db_user -p$db_password $database > $database"_backup_"$timestamp".sql"

    # Zip the backup file
    zip $database"_backup_"$timestamp".zip" $database"_backup_"$timestamp".sql"

    # Remove the .sql file after zipping
    rm $database"_backup_"$timestamp".sql"

}

function remove_backups(){

    # Find and delete backup files older than 30 days
    find . -name "$database"_backup_* -mtime +30 -exec rm {} \;
}



# Backup
run_backup
remove_backups
