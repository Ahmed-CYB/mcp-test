-- Database backup created on 2024-01-15
-- Contains user accounts, permissions, and application data

CREATE DATABASE corporate_db;
USE corporate_db;

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    password_hash VARCHAR(255),
    department VARCHAR(50),
    access_level INT
);

INSERT INTO users VALUES
(1, 'admin', 'hash_admin_secure_key', 'IT', 5),
(2, 'jdoe', 'hash_employee123', 'Engineering', 2),
(3, 'hruser', 'hash_hr2024', 'HR', 3),
(4, 'backupuser', 'hash_backup456', 'IT', 4);

CREATE TABLE sensitive_data (
    id INT PRIMARY KEY,
    data_type VARCHAR(50),
    content TEXT,
    classification VARCHAR(20)
);

INSERT INTO sensitive_data VALUES
(1, 'flag', 'CTF{ftp_anonymous_leads_to_credential_discovery_2024}', 'confidential');

-- End of backup