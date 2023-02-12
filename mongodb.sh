#! /bin/bash

database=$1
destination=$2
db_host=$3
db_user=$4
db_password=$5
destination=$6

timestamp=$(date +%Y-%m-%d_%H-%M-%S)
file_name_or_directory = $database"_backup_"$timestamp

# Change to backup directory
cd destination

function run_backup(){

    # Backup the database
    mongodump --db database --username db_user --password db_password --host db_host --out $file_name_or_directory

    # Zip the backup folder
    zip -r $file_name_or_directory".zip" $file_name_or_directory

    # Remove the backup folder after zipping
    rm -rf $file_name_or_directory

}

function remove_backups(){

    # Find and delete backup files older than 30 days
    find . -name "$file_name_or_directory"* -mtime +30 -exec rm {} \;
}



# Backup
run_backup
remove_backups
