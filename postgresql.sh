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

    export PGPASSWORD=$db_password
    pg_dump -F t -U $db_user -h $db_host $database -f $file_name_or_directory".tar"

    # Zip the backup folder
    zip -j $file_name_or_directory".zip" $file_name_or_directory".tar"

    # Remove the backup folder after zipping
    rm $file_name_or_directory".tar"

}

function remove_backups(){

    # Find and delete backup files older than 30 days
    find . -name "$file_name_or_directory"* -mtime +30 -exec rm {} \;
}



# Backup
run_backup
remove_backups
