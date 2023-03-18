#! /bin/bash

database=$1
destination=$2
db_host=$3
db_user=$4
db_password=$5
db_port=$6

timestamp=$(date +%Y-%m-%d_%H-%M-%S)
file_name_or_directory = $database"_backup_"$timestamp


# Change to backup directory
cd $destination

function run_backup(){

    # Backup the database
    mysqldump -h $db_host -u $db_user -p$db_password $database > $file_name_or_directory".sql"

    # Zip the backup file
    zip $file_name_or_directory".zip" $file_name_or_directory".sql"

    # Remove the .sql file after zipping
    rm $file_name_or_directory".sql"

}

function remove_backups(){

    # Find and delete backup files older than 30 days
    find . -name "$file_name_or_directory"* -mtime +30 -exec rm {} \;
}



# Backup
run_backup
remove_backups
