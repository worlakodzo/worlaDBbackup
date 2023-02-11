#!/bin/bash

# Display the help message
display_help() {
    echo "Usage: $0 [-h] [-d <database_name>] [-p <backup_destination>] [-t <database_engine_type>]"
    echo
    echo "Backup a database from MySQL, PostgreSQL, MariaDB, SQLite, MongoDB,"
    echo "ElasticSearch, redis, memcached and zip it with a timestamp."
    echo
    echo "Options:"
    echo "  -h            Display this help message and exit"
    echo "  -d <database> The name of the database to be backed up"
    echo "  -p <backup_destination> The destination path to store the database back up"
    echo "  -t <database_engine_type> The type of database engine to backup from (i.e MySQL, PostgreSQL"
    echo "   MariaDB, SQLite, MongoDB, ElasticSearch, redis, memcached)"
    echo 
    echo "Environment variable"
    echo 
    echo "MySQL (BACKUP_MYSQL_DB_HOST, BACKUP_MYSQL_DB_USER, BACKUP_MYSQL_DB_PASSWORD)"
    echo
}

# Parse the command line options
while getopts "hd:p:t:" opt; do
    case $opt in
        h)
            display_help
            exit 0
            ;;
        d)
            database=$OPTARG
            ;;
        p)
            destination=$OPTARG
            ;;
        t)
            engine_type="${OPTARG,,}"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
    esac
done


# Select script base on
# database engine
case $engine_type in
    mysql)
        bash mysql.sh $database $destination $BACKUP_MYSQL_DB_HOST $BACKUP_MYSQL_DB_USER $BACKUP_MYSQL_DB_PASSWORD
        ;;
    mariadb)
        database=$OPTARG
        ;;
    postgresql)
        destination=$OPTARG
        ;;
    sqlite)
        engine_type=$OPTARG
        ;;
    mongodb)
        engine_type=$OPTARG
        ;;
    elasticsearch)
        engine_type=$OPTARG
        ;;
    redis)
        engine_type=$OPTARG
        ;;
    memcached)
        engine_type=$OPTARG
        ;;
    \?)
        echo "Invalid database engine: $engine_type" >&2
        exit 1
        ;;
esac





