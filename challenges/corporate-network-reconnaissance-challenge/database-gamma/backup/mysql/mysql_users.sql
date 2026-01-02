-- TechCorp MySQL User Database Backup
-- Generated from database-gamma staging environment
-- WARNING: Contains development credentials

USE mysql;

-- Staging users with weak passwords
CREATE USER 'staging_user'@'%' IDENTIFIED BY 'staging123';
CREATE USER 'dbadmin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER 'ldap_sync'@'192.168.1.%' IDENTIFIED BY 'sync_pass';
CREATE USER 'app_user'@'%' IDENTIFIED BY 'app123';

-- Grant excessive privileges for development
GRANT ALL PRIVILEGES ON *.* TO 'staging_user'@'%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'localhost';
GRANT SELECT, INSERT, UPDATE ON techcorp.* TO 'ldap_sync'@'192.168.1.%';
GRANT SELECT ON techcorp.users TO 'app_user'@'%';

-- Development database
CREATE DATABASE IF NOT EXISTS techcorp;
USE techcorp;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100),
    role VARCHAR(20),
    department VARCHAR(50)
);

INSERT INTO users VALUES 
(1, 'admin', 'admin123', 'administrator', 'IT'),
(2, 'staging_user', 'staging123', 'developer', 'Development'),
(3, 'ldap_sync', 'sync_pass', 'service', 'Infrastructure');

FLUSH PRIVILEGES;