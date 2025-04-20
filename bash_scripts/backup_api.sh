#!/bin/bash
# backup_api.sh
# Backs up API files and database, logs to /var/log/backup.log
BACKUP_DIR="/home/ubuntu/backups"
API_DIR="/home/ubuntu"
DB_NAME="studentdb"
DB_USER="postgres"
LOG_FILE="/var/log/backup.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
BACKUP_DATE=$(date '+%F')
mkdir -p $BACKUP_DIR
sudo touch $LOG_FILE
sudo chmod 664 $LOG_FILE
log_message() {
    echo "[$TIMESTAMP] $1" | sudo tee -a $LOG_FILE
}
tar -czf $BACKUP_DIR/api_backup_$BACKUP_DATE.tar.gz $API_DIR/student-api-0.0.1-SNAPSHOT.jar 2>/dev/null
if [ $? -eq 0 ]; then
    log_message "API backup successful: api_backup_$BACKUP_DATE.tar.gz"
else
    log_message "ERROR: API backup failed"
    exit 1
fi
PGPASSWORD=mwema pg_dump -U $DB_USER $DB_NAME > $BACKUP_DIR/db_backup_$BACKUP_DATE.sql
if [ $? -eq 0 ]; then
    log_message "Database backup successful: db_backup_$BACKUP_DATE.sql"
else
    log_message "ERROR: Database backup failed"
    exit 1
fi
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -delete
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -delete
log_message "Deleted backups older than 7 days"
