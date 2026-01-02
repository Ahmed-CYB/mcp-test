CREATE DATABASE IF NOT EXISTS corporate_db;
USE corporate_db;

CREATE USER 'webapp'@'localhost' IDENTIFIED BY 'devpass123';
GRANT ALL PRIVILEGES ON corporate_db.* TO 'webapp'@'localhost';

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, password, role) VALUES
('admin', 'admin123', 'administrator'),
('dev', 'developer', 'developer'),
('backup', 'backup456', 'service');

CREATE TABLE network_devices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    device_name VARCHAR(100) NOT NULL,
    ip_address VARCHAR(15) NOT NULL,
    device_type VARCHAR(50) NOT NULL,
    default_creds VARCHAR(100) NOT NULL,
    notes TEXT
);

INSERT INTO network_devices (device_name, ip_address, device_type, default_creds, notes) VALUES
('Router-Main', '192.168.1.1', 'router', 'admin:admin', 'Main gateway router'),
('Switch-Core', '192.168.1.10', 'switch', 'cisco:cisco', 'Core network switch'),
('AP-Guest', '192.168.1.20', 'wireless', 'root:toor', 'Guest wireless access point'),
('Firewall-DMZ', '192.168.1.30', 'firewall', 'admin:password', 'DMZ firewall appliance');

CREATE TABLE flag_storage (
    id INT AUTO_INCREMENT PRIMARY KEY,
    piece_number INT NOT NULL,
    encrypted_data TEXT NOT NULL,
    decryption_key VARCHAR(50) NOT NULL
);

INSERT INTO flag_storage (piece_number, encrypted_data, decryption_key) VALUES
(2, 'c2NhbmluZ19tYXN0ZXJfZmxhZw==', 'network_recon');

FLUSH PRIVILEGES;