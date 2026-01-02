#!/bin/bash
# Automated backup configuration for FTP server
# Created by: IT Admin
# Last modified: March 2024

# FTP Server backup settings
FTP_HOST="localhost"
FTP_PORT="26"
FTP_USER="backup"
FTP_PASS="backup2023"

# Backup directories
BACKUP_DIRS=(
    "/srv/ftp/users/admin"
    "/srv/ftp/users/reports"
    "/srv/ftp/users/smith"
    "/srv/ftp/users/johnson"
)

# Backup destination
BACKUP_DEST="/backup/ftp/$(date +%Y%m%d)"

# Create backup directory
mkdir -p "$BACKUP_DEST"

echo "Starting FTP backup process..."
echo "Timestamp: $(date)"
echo "Backing up to: $BACKUP_DEST"

# Note: This script reveals the custom port and backup credentials
# Security risk: Plain text passwords in script files

for dir in "${BACKUP_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Backing up: $dir"
        cp -r "$dir" "$BACKUP_DEST/"
    else
        echo "Warning: Directory not found: $dir"
    fi
done

echo "Backup completed successfully"
echo "Files backed up to: $BACKUP_DEST"