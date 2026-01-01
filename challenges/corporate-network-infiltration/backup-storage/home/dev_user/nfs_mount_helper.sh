#!/bin/bash
# NFS Mount Helper Script
# TechCorp Development Team
# Usage: ./nfs_mount_helper.sh [mount_point]

NFS_SERVER="backup-storage"
ENCRYPTED_SHARE="/srv/nfs/encrypted"
PUBLIC_SHARE="/srv/nfs/public"
DEV_SHARE="/srv/nfs/development"

if [ $# -eq 0 ]; then
    echo "Available NFS shares on $NFS_SERVER:"
    echo "1. $PUBLIC_SHARE (public access)"
    echo "2. $DEV_SHARE (development files)"
    echo "3. $ENCRYPTED_SHARE (encrypted - requires authentication)"
    echo ""
    echo "Usage: $0 [local_mount_point]"
    echo "Example: $0 /mnt/nfs_share"
    exit 1
fi

MOUNT_POINT=$1

echo "Attempting to mount NFS shares..."
echo "Note: Encrypted share requires nfs_admin credentials"
echo "Hint: Check SMB development share for credential files"

# Create mount point if it doesn't exist
sudo mkdir -p $MOUNT_POINT

# Try mounting public share first
echo "Mounting public share..."
sudo mount -t nfs $NFS_SERVER:$PUBLIC_SHARE $MOUNT_POINT/public

if [ $? -eq 0 ]; then
    echo "Public share mounted successfully at $MOUNT_POINT/public"
else
    echo "Failed to mount public share"
fi

# Encrypted share requires proper authentication
echo "For encrypted share access, use:"
echo "sudo mount -t nfs -o sec=sys $NFS_SERVER:$ENCRYPTED_SHARE $MOUNT_POINT/encrypted"
echo "Then authenticate with nfs_admin credentials"