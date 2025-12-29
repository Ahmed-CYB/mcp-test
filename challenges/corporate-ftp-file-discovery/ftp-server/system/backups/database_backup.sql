-- Database Backup Script
-- Generated: 2024-01-25 02:00:00
-- Server: ftp-server
-- Database: corporate_db

CREATE DATABASE IF NOT EXISTS corporate_db;
USE corporate_db;

-- User accounts table
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(255),
    role VARCHAR(20)
);

INSERT INTO users VALUES
(1, 'admin', 'hash123', 'administrator'),
(2, 'ftpuser', 'hash456', 'ftp_access'),
(3, 'backup', 'hash789', 'backup_service');

-- System configuration
CREATE TABLE config (
    setting_name VARCHAR(100),
    setting_value VARCHAR(255)
);

INSERT INTO config VALUES
('ftp_enabled', 'true'),
('backup_location', '/system/backups'),
('security_key', 'CTF{database_backup_found}'),
('last_audit', '2024-01-15');

-- End of backup