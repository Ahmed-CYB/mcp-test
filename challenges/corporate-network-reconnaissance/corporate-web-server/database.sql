CREATE DATABASE corporate_network;
USE corporate_network;

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO comments (author, department, content) VALUES 
('Alice Johnson', 'Network Security', 'Completed security scan of web servers in 192.168.10.0/24 range. All systems running standard HTTP/HTTPS services.'),
('Bob Chen', 'System Administration', 'File server cluster at 192.168.20.42 is operational. SMB and FTP services active for document sharing.'),
('Carol Davis', 'Legacy Systems', 'SNMP monitoring active on 192.168.30.88. Community string updated for read-only access. Telnet still enabled for legacy compatibility.'),
('David Wilson', 'IT Security', 'Network topology documentation stored in /etc/network/topology.xml on primary systems. Contains detailed service mappings.'),
('Emma Thompson', 'Compliance', 'All three network segments require comprehensive service discovery. Use nmap with appropriate flags for complete enumeration.'),
('Frank Miller', 'Operations', 'Internal flag storage: CTF{xxe_network_recon_complete_d8f7e9a2} located in system configuration files across discovered services.');

CREATE USER 'webapp'@'localhost' IDENTIFIED BY 'web123';
GRANT SELECT, INSERT ON corporate_network.* TO 'webapp'@'localhost';
FLUSH PRIVILEGES;