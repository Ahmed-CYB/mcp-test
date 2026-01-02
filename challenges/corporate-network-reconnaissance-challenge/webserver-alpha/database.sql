-- TechCorp Admin Portal Database Schema
-- PostgreSQL Database Setup

CREATE DATABASE techcorp_admin;

\c techcorp_admin;

-- Users table for authentication
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user',
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP
);

-- Insert test users (vulnerable to SQL injection)
INSERT INTO users (username, password, role, email) VALUES
('admin', 'admin123', 'admin', 'admin@techcorp.local'),
('netadmin', 'network_pass_456', 'admin', 'netadmin@techcorp.local'),
('operator', 'operator789', 'user', 'operator@techcorp.local'),
('scanner', 'scan_user_321', 'user', 'scanner@techcorp.local'),
('guest', 'guest123', 'guest', 'guest@techcorp.local');

-- Network servers table
CREATE TABLE network_servers (
    id SERIAL PRIMARY KEY,
    hostname VARCHAR(100) NOT NULL,
    ip_address INET NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    services TEXT,
    last_scan TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO network_servers (hostname, ip_address, status, services) VALUES
('webserver-alpha', '192.168.1.10', 'active', 'HTTP,HTTPS,SSH,FTP'),
('fileserver-beta', '192.168.1.20', 'active', 'SMB,FTP,SNMP'),
('database-gamma', '192.168.1.30', 'active', 'MySQL,SSH'),
('workstation-01', '192.168.1.100', 'active', 'RDP,SSH'),
('printer-01', '192.168.1.200', 'active', 'HTTP,SNMP');

-- Services table
CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    server_id INTEGER REFERENCES network_servers(id),
    service_name VARCHAR(50) NOT NULL,
    port INTEGER NOT NULL,
    protocol VARCHAR(10) DEFAULT 'TCP',
    version VARCHAR(100),
    status VARCHAR(20) DEFAULT 'running'
);

INSERT INTO services (server_id, service_name, port, protocol, version, status) VALUES
(1, 'Apache HTTP', 80, 'TCP', '2.4.41', 'running'),
(1, 'Apache HTTPS', 443, 'TCP', '2.4.41 SSL', 'running'),
(1, 'OpenSSH', 22, 'TCP', '8.2', 'running'),
(1, 'vsftpd', 21, 'TCP', '3.0.3', 'running'),
(2, 'Samba', 445, 'TCP', '4.11.6', 'running'),
(2, 'vsftpd', 21, 'TCP', '3.0.3', 'running'),
(2, 'Net-SNMP', 161, 'UDP', '5.8', 'running'),
(3, 'MySQL', 3306, 'TCP', '8.0.25', 'running'),
(3, 'OpenSSH', 22, 'TCP', '8.2', 'running');

-- Scan results table
CREATE TABLE scan_results (
    id SERIAL PRIMARY KEY,
    target VARCHAR(100) NOT NULL,
    scan_type VARCHAR(50) NOT NULL,
    results TEXT,
    scan_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO scan_results (target, scan_type, results) VALUES
('192.168.1.0/24', 'network_discovery', '24 hosts discovered in subnet'),
('192.168.1.10', 'port_scan', 'Open ports: 21,22,80,443'),
('192.168.1.20', 'port_scan', 'Open ports: 21,161,445'),
('192.168.1.30', 'port_scan', 'Open ports: 22,3306'),
('192.168.1.10', 'service_scan', 'HTTP: Apache 2.4.41, SSH: OpenSSH 8.2'),
('192.168.1.20', 'snmp_scan', 'SNMP community: public, System: Linux fileserver-beta');

-- Create database user
CREATE USER admin_user WITH PASSWORD 'admin_pass_2024';
GRANT ALL PRIVILEGES ON DATABASE techcorp_admin TO admin_user;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_user;

-- Grant usage on schema
GRANT USAGE ON SCHEMA public TO admin_user;

-- Comments for CTF context
COMMENT ON TABLE users IS 'User authentication table - vulnerable to SQL injection in login form';
COMMENT ON TABLE network_servers IS 'Network infrastructure inventory for TechCorp internal network';
COMMENT ON TABLE services IS 'Service enumeration results from network scanning';
COMMENT ON TABLE scan_results IS 'Historical network reconnaissance data';