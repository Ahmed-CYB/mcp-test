CREATE DATABASE IF NOT EXISTS corporate_db;
USE corporate_db;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    access_level INT DEFAULT 1
);

CREATE TABLE system_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    service VARCHAR(50),
    message TEXT,
    severity VARCHAR(20)
);

INSERT INTO employees (username, email, department, access_level) VALUES
('jsmith', 'jsmith@legacycorp.com', 'IT', 3),
('sjohnson', 'sjohnson@legacycorp.com', 'IT', 3),
('mdavis', 'mdavis@legacycorp.com', 'IT', 3),
('lwilson', 'lwilson@legacycorp.com', 'HR', 2),
('agarcia', 'agarcia@legacycorp.com', 'Finance', 2),
('guest', 'guest@legacycorp.com', 'Public', 1);

INSERT INTO system_logs (service, message, severity) VALUES
('telnet', 'Public access terminal activated on port 20', 'INFO'),
('mysql', 'Database service started with network binding', 'INFO'),
('snmp', 'SNMP agent configured with default communities', 'WARNING'),
('tftp', 'TFTP server enabled for configuration management', 'INFO');

CREATE USER 'guest'@'%' IDENTIFIED BY 'guest123';
GRANT SELECT ON corporate_db.* TO 'guest'@'%';
FLUSH PRIVILEGES;