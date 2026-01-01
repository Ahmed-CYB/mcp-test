-- TechCorp Database Backup
-- Date: 2024-01-15 03:00:00
-- Database: production_db
-- Backup Type: Full

CREATE DATABASE IF NOT EXISTS techcorp_backup;
USE techcorp_backup;

-- User accounts table
CREATE TABLE user_accounts (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(128),
    department VARCHAR(50),
    access_level INT
);

INSERT INTO user_accounts VALUES
(1, 'admin', 'e99a18c428cb38d5f260853678922e03', 'IT', 10),
(2, 'dev_user', '5f4dcc3b5aa765d61d8327deb882cf99', 'Development', 5),
(3, 'nfs_admin', '25d55ad283aa400af464c76d713c07ad', 'Infrastructure', 8),
(4, 'backup_admin', '098f6bcd4621d373cade4e832627b4f6', 'Operations', 9);

-- Network shares configuration
CREATE TABLE network_shares (
    share_name VARCHAR(50),
    share_path VARCHAR(200),
    access_type VARCHAR(20),
    encryption_status VARCHAR(20)
);

INSERT INTO network_shares VALUES
('development', '/srv/samba/development', 'guest', 'none'),
('backups', '/srv/samba/backups', 'authenticated', 'none'),
('nfs_public', '/srv/nfs/public', 'world_readable', 'none'),
('nfs_encrypted', '/srv/nfs/encrypted', 'restricted', 'aes128_weak');

-- Security audit notes
CREATE TABLE audit_notes (
    id INT PRIMARY KEY,
    finding VARCHAR(500),
    severity VARCHAR(20),
    status VARCHAR(20)
);

INSERT INTO audit_notes VALUES
(1, 'NFS shares using weak AES-128 encryption with hardcoded keys', 'HIGH', 'OPEN'),
(2, 'SMB guest access enabled on development share', 'MEDIUM', 'OPEN'),
(3, 'SSH root login permitted on multiple ports', 'MEDIUM', 'OPEN'),
(4, 'Backup credentials stored in plaintext files', 'CRITICAL', 'OPEN');

-- Flag location hint
-- The final encrypted flag is stored in the NFS encrypted share
-- Decryption requires the key file found in the same directory
-- File: encrypted_flag.txt
-- Key: .nfs_key