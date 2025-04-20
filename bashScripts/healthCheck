#!/bin/bash
# healthCheck.sh

# Monitors server health and API status, logs to /var/log/server_health.log

LOG_FILE="/var/log/server_health.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
sudo touch $LOG_FILE
sudo chmod 664 $LOG_FILE

log_message() {
    echo "[$TIMESTAMP] $1" | sudo tee -a $LOG_FILE
}
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$CPU_USAGE > 80" | bc -l) )); then
    log_message "WARNING: High CPU usage: ${CPU_USAGE}%"
else
    log_message "CPU usage: ${CPU_USAGE}%"
fi
MEMORY_TOTAL=$(free -m | grep Mem | awk '{print $2}')
MEMORY_USED=$(free -m | grep Mem | awk '{print $3}')
MEMORY_PERCENT=$((MEMORY_USED * 100 / MEMORY_TOTAL))
if [ $MEMORY_PERCENT -gt 80 ]; then
    log_message "WARNING: High memory usage: ${MEMORY_PERCENT}%"
else
    log_message "Memory usage: ${MEMORY_PERCENT}%"
fi
DISK_USAGE=$(df -h / | grep / | awk '{print $5}' | cut -d'%' -f1)
if [ $DISK_USAGE -gt 90 ]; then
    log_message "WARNING: Low disk space: ${DISK_USAGE}%"
else
    log_message "Disk space usage: ${DISK_USAGE}%"
fi
if systemctl is-active --quiet nginx; then
    log_message "Nginx is running"
else
    log_message "WARNING: Nginx is not running"
fi
STUDENTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/students)
SUBJECTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/subjects)
if [ $STUDENTS_STATUS -eq 200 ]; then
    log_message "/students endpoint is up (200 OK)"
else
    log_message "WARNING: /students endpoint failed (Status: $STUDENTS_STATUS)"
fi
if [ $SUBJECTS_STATUS -eq 200 ]; then
    log_message "/subjects endpoint is up (200 OK)"
else
    log_message "WARNING: /subjects endpoint failed (Status: $SUBJECTS_STATUS)"
fi
