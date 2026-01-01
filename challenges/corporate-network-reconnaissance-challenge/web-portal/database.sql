-- PostgreSQL Database Setup for CorpNet Portal
-- Create database and user
CREATE DATABASE corpnet;
CREATE USER portal_user WITH ENCRYPTED PASSWORD 'portal123';
GRANT ALL PRIVILEGES ON DATABASE corpnet TO portal_user;

-- Connect to corpnet database
\c corpnet;

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reset_token VARCHAR(100),
    role VARCHAR(20) DEFAULT 'user'
);

-- Create admin_tokens table (for flag storage)
CREATE TABLE admin_tokens (
    id SERIAL PRIMARY KEY,
    token VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    flag TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create network_scans table (for logging)
CREATE TABLE network_scans (
    id SERIAL PRIMARY KEY,
    target_ip VARCHAR(45),
    scan_type VARCHAR(20),
    results TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample users
INSERT INTO users (username, email, password_hash, active, role) VALUES
('admin', 'admin@corpnet.local', 'e10adc3949ba59abbe56e057f20f883e', true, 'admin'),
('jsmith', 'john.smith@corpnet.local', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', true, 'user'),
('mjones', 'mary.jones@corpnet.local', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', true, 'user'),
('bwilson', 'bob.wilson@corpnet.local', 'cd74e0b0df9c9e7d8b1c2e5f3a4d5c6b7e8f9a0b1c2d3e4f5a6b7c8d9e0f1a2b', false, 'user'),
('sgarcia', 'sarah.garcia@corpnet.local', 'a1b2c3d4e5f6789012345678901234567890abcdef1234567890abcdef123456', true, 'user');

-- Insert admin token with flag
INSERT INTO admin_tokens (token, description, flag) VALUES
('admin_reset_token_2024', 'Administrative password reset token', 'CTF{blind_sqli_timing_attack_success}');

-- Insert sample network scan data
INSERT INTO network_scans (target_ip, scan_type, results) VALUES
('192.168.100.10', 'tcp', 'PORT STATE SERVICE\n22/tcp open ssh\n80/tcp open http\n443/tcp open https'),
('192.168.100.20', 'tcp', 'PORT STATE SERVICE\n22/tcp open ssh\n5432/tcp open postgresql\n3306/tcp open mysql'),
('192.168.100.30', 'tcp', 'PORT STATE SERVICE\n22/tcp open ssh\n21/tcp open ftp\n445/tcp open microsoft-ds\n139/tcp open netbios-ssn');

-- Grant permissions to portal_user
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO portal_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO portal_user;

-- Create index for performance
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_active ON users(active);
CREATE INDEX idx_admin_tokens_token ON admin_tokens(token);

-- Insert additional user for blind SQLi testing
INSERT INTO users (username, email, password_hash, active) VALUES
('testuser', 'test@corpnet.local', 'testpass123hash', true);

-- Add some inactive users for testing
INSERT INTO users (username, email, password_hash, active) VALUES
('inactive1', 'old1@corpnet.local', 'oldhash1', false),
('inactive2', 'old2@corpnet.local', 'oldhash2', false);

COMMIT;