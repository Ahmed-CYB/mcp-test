-- Corporate Database Backup
-- Access requires network_admin credentials
-- Generated: 2024-01-15 10:30:00

CREATE TABLE system_flags (
    id INT PRIMARY KEY,
    fragment VARCHAR(255),
    timestamp DATETIME
);

INSERT INTO system_flags VALUES (
    2,
    'b3JhdGVf',
    '2024-01-15 10:30:15'
);

-- Fragment 2 stored in base64 format
-- Combine with other fragments for complete flag