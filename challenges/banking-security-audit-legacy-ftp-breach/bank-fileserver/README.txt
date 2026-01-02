BANKING SECURITY ASSESSMENT

You've gained access to the legacy FTP server. The customer database is encrypted, but the audit logs reveal concerning security practices:

- Weak MD5 hashing for key storage
- Simple password policies
- Legacy encryption methods

Your objective: Decrypt the customer records to demonstrate the security vulnerability.

Files discovered:
- audit_log.txt: Contains MD5 hashes of encryption keys
- customer_records.enc: Encrypted customer database
- db_schema.sql: Database structure and security notes

The flag is hidden within the decrypted customer records.