Backup Directory - Corporate File Server
========================================

This directory contains encrypted system backups.
All backup files are encrypted using AES-256.

Backup Schedule:
- Daily: Employee data and configurations
- Weekly: Full system backup
- Monthly: Archive backup

Decryption Key Location:
- Master key stored in admin directory
- Emergency key with IT Security team
- Backup key in safe deposit box

Files in this directory:
- backup_manifest.enc - Contains backup inventory and metadata
- system_config.enc - System configuration backup (not present)
- employee_data.enc - Employee database backup (not present)

Note: Some backup files may be missing due to recent maintenance.
Contact backupuser for restoration requests.

Last Backup: 2024-03-20 02:30:00
Next Scheduled: 2024-03-21 02:30:00

IMPORTANT: Decryption key format is simple for testing: backup_key_2024