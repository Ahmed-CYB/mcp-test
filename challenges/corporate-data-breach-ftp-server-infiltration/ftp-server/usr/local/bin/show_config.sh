#!/bin/bash
# Show backup configuration

echo "=== Backup System Configuration ==="
echo "Backup schedule: Daily at 02:00"
echo "Retention period: 30 days"
echo "Encryption: AES-256-CBC"
echo "Compression: gzip -9"
echo ""
echo "Configuration files:"
echo "- /backup/config/backup.conf"
echo "- /backup/config/encryption.conf"
echo "- /backup/config/schedule.conf"
echo ""
echo "Master encryption key: backup_master_2024"
echo "Key derivation: PBKDF2 with 10000 iterations"