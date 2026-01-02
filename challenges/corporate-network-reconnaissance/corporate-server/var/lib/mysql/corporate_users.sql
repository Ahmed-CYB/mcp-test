CREATE DATABASE corporate;
USE corporate;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(100),
    department VARCHAR(50),
    access_level VARCHAR(20)
);

INSERT INTO employees VALUES 
(1, 'admin', 'corp_admin_2023', 'IT', 'administrator'),
(2, 'jsmith', 'welcome123', 'Sales', 'user'),
(3, 'mwilson', 'password456', 'HR', 'user'),
(4, 'backup_svc', 'backup_service_key', 'IT', 'service'),
(5, 'telnet_admin', 'legacy_access_789', 'IT', 'administrator');

CREATE TABLE system_flags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flag_name VARCHAR(100),
    flag_value VARCHAR(200),
    description TEXT
);

INSERT INTO system_flags VALUES
(1, 'database_access', 'CTF{mysql_anonymous_access_discovered_7b3c1}', 'Database enumeration flag'),
(2, 'privilege_escalation', 'CTF{telnet_root_shell_achieved_9d8f5}', 'Root access through telnet service');

GRANT ALL PRIVILEGES ON corporate.* TO ''@'%';
FLUSH PRIVILEGES;