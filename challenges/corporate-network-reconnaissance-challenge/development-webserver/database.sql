-- PostgreSQL Database Setup for DevBlog
-- Corporate Development Network Database

CREATE DATABASE devblog;
\c devblog;

-- Blog posts table
CREATE TABLE blog_posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Search logs table (vulnerable to SQL injection)
CREATE TABLE search_logs (
    id SERIAL PRIMARY KEY,
    query TEXT,
    user_agent TEXT,
    client_ip VARCHAR(45),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Network credentials table (contains flag fragment)
CREATE TABLE network_credentials (
    id SERIAL PRIMARY KEY,
    service VARCHAR(100),
    hostname VARCHAR(100),
    username VARCHAR(100),
    password VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- System configuration table (contains flag fragment)
CREATE TABLE system_config (
    id SERIAL PRIMARY KEY,
    config_key VARCHAR(100),
    config_value TEXT,
    description TEXT
);

-- Insert blog posts
INSERT INTO blog_posts (title, content, author) VALUES
('Network Infrastructure Update', 'The corporate network has been segmented into multiple subnets for enhanced security. The development environment is now isolated on 192.168.10.0/24 with restricted access to production systems.', 'admin'),
('Database Migration Complete', 'Successfully migrated all development databases to PostgreSQL 12.5. The new setup includes improved logging and monitoring capabilities for better security analysis.', 'dbadmin'),
('Security Scanning Results', 'Latest vulnerability scan shows several services exposed on the development network. SSH, Telnet, and MySQL services are accessible for authorized personnel only.', 'security'),
('Backup Storage Configuration', 'Configured automated backups to the corporate file server. Access credentials are stored securely in the database for emergency recovery procedures.', 'sysadmin'),
('Development Server Deployment', 'New development web server deployed at development-webserver.corp.local. All team members should update their documentation accordingly.', 'devteam');

-- Insert network credentials (contains part of flag)
INSERT INTO network_credentials (service, hostname, username, password, notes) VALUES
('ssh', 'fileserver.corp.local', 'backup_user', 'backup123', 'File server access for automated backups'),
('mysql', 'database.corp.local', 'dev_user', 'devpass456', 'Development database access'),
('telnet', 'router.corp.local', 'admin', 'router789', 'Legacy router management - flag_part_1: CTF{n3tw0rk_'),
('ftp', 'backup.corp.local', 'ftpuser', 'ftppass321', 'Backup storage FTP access'),
('ssh', 'monitoring.corp.local', 'monitor', 'monitor654', 'Network monitoring system access');

-- Insert system configuration (contains part of flag)
INSERT INTO system_config (config_key, config_value, description) VALUES
('database_host', 'localhost:5432', 'PostgreSQL database connection'),
('backup_interval', '24', 'Backup interval in hours'),
('log_retention', '30', 'Log retention period in days'),
('encryption_key', 'r3c0nn41ss4nc3_c0mpl3t3}', 'System encryption key - flag_part_2'),
('max_connections', '100', 'Maximum database connections'),
('session_timeout', '3600', 'Session timeout in seconds');

-- Sample search logs
INSERT INTO search_logs (query, user_agent, client_ip) VALUES
('network topology', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', '192.168.10.100'),
('database credentials', 'curl/7.68.0', '192.168.10.101'),
('backup server', 'Mozilla/5.0 (X11; Linux x86_64)', '192.168.10.102');

-- Grant permissions
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO devblog_user;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO devblog_user;

-- Create database user
CREATE USER devblog_user WITH PASSWORD 'devblog2024';