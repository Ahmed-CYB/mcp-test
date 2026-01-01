#!/bin/bash
# Automated backup synchronization script
# Last modified: 2023-11-15
# Author: IT Department

echo "Starting backup sync process..."
echo "Connecting to SMB share with credentials..."

# SMB Connection Details
SMB_USER="backup_admin"
SMB_PASS="Backup2023!Corp"
SMB_SHARE="//corporate-fileserver/internal_docs"

# Create mount point
sudo mkdir -p /mnt/backup_sync

# Mount SMB share
sudo mount -t cifs $SMB_SHARE /mnt/backup_sync -o username=$SMB_USER,password=$SMB_PASS,uid=1000,gid=1000

if [ $? -eq 0 ]; then
    echo "SMB mount successful"
    echo "Syncing files..."
    rsync -av /mnt/backup_sync/ /srv/ftp/backup/
    sudo umount /mnt/backup_sync
    echo "Backup sync completed successfully"
else
    echo "Failed to mount SMB share"
    exit 1
fi

echo "Backup process finished at $(date)"