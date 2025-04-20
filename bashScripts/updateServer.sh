#!/bin/bash
# update_server.sh
# Updates server packages and API code, logs to /var/log/update.log
LOG_FILE="/var/log/update.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
REPO_DIR="/home/ubuntu/student-api"
sudo touch $LOG_FILE
sudo chmod 664 $LOG_FILE
log_message() {
    echo "[$TIMESTAMP] $1" | sudo tee -a $LOG_FILE
}
sudo apt update && sudo apt upgrade -y
if [ $? -eq 0 ]; then
    log_message "System packages updated successfully"
else
    log_message "ERROR: System package update failed"
    exit 1
fi
cd $REPO_DIR
git pull origin main
if [ $? -eq 0 ]; then
    log_message "Git pull successful"
    mvn clean package
    if [ $? -eq 0 ]; then
        log_message "Maven build successful"
        sudo systemctl restart student-api
        log_message "API service restarted"
    else
        log_message "ERROR: Maven build failed"
        exit 1
    fi
else
    log_message "ERROR: Git pull failed"
    exit 1
fi
