-- Banking Database Schema
-- Customer Records Table
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    account_number VARCHAR(20),
    balance DECIMAL(15,2),
    ssn_hash VARCHAR(32),
    created_date TIMESTAMP
);

-- Audit Note: All sensitive data encrypted with AES-256
-- Key derivation: MD5 hash collision vulnerability identified
-- Recommendation: Upgrade to SHA-256 immediately
-- Critical: Simple passwords detected in key generation