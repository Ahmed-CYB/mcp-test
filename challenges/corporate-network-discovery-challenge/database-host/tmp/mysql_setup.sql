CREATE DATABASE corporate_db;
USE corporate_db;

CREATE TABLE network_hosts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hostname VARCHAR(50),
    ip_address VARCHAR(15),
    services TEXT,
    status VARCHAR(20)
);

INSERT INTO network_hosts VALUES
(1, 'database-host', '192.168.100.10', 'mysql,telnet,dns,info', 'active'),
(2, 'web-server', '192.168.100.20', 'http,https', 'active'),
(3, 'file-server', '192.168.100.30', 'smb,ftp', 'active'),
(4, 'mail-server', '192.168.100.40', 'smtp,pop3,imap', 'active'),
(5, 'admin-panel', '192.168.100.50', 'https', 'maintenance'),
(6, 'backup-system', '192.168.100.60', 'rsync,ssh', 'active'),
(7, 'monitoring', '192.168.100.70', 'snmp,http', 'active');

CREATE USER 'guest'@'%' IDENTIFIED BY 'guest123';
GRANT SELECT ON corporate_db.* TO 'guest'@'%';

CREATE USER 'dbadmin'@'%' IDENTIFIED BY 'dbpass2023';
GRANT ALL PRIVILEGES ON *.* TO 'dbadmin'@'%';

FLUSH PRIVILEGES;