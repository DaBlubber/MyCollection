#!/bin/bash

# Name des Docker Containers
CONTAINER_NAME="mariadb"

# Pfad zum Backup Verzeichnis
BACKUP_DIR="/usr/local/container/backup/MariaDB"

# Name der Datenbank
DATABASENAME=("DB1" "DB2" "DB3")

# Username und Passwort
USERNAME="DB User"
PASSWORD="DB User Passwort"

# Datum im Format JJJJMMTT
DATE=$(date +%Y%m%d)

# Ausführen des Backup Commands
for DB in "${DATABASENAME[@]}"; do 
docker exec -e MYSQL_PWD=${PASSWORD} ${CONTAINER_NAME} /usr/bin/mariadb-dump -u ${USERNAME} ${DB} > ${BACKUP_DIR}/mariadbbak_${DB}_${DATE}.sql
zip ${BACKUP_DIR}/mariadbbak_${DB}_${DATE}.zip ${BACKUP_DIR}/mariadbbak_${DB}_${DATE}.sql
rm ${BACKUP_DIR}/mariadbbak_${DB}_${DATE}.sql
done

echo "Backup Completed!"