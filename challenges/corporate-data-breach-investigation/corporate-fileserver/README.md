# SMB Investigation Challenge

## Scenario
A financial consulting firm's file server has been compromised. Attackers gained unauthorized access to SMB shares using hash collision attacks and retrieved encrypted client data.

## Your Mission
1. Analyze the SMB access logs to understand the attack vector
2. Investigate the hash collision vulnerability
3. Decrypt the stolen client backup file
4. Extract the sensitive flag from the recovered data

## Files Discovered
- `client_backup.enc`: Encrypted backup file accessed by attackers
- `smb_access.log`: SMB server access logs showing the breach
- `hash_analysis.txt`: Security analysis of the compromised hash

## Investigation Notes
- The backup file uses multiple layers of encoding
- Hash collision allowed bypass of authentication
- Mathematical hints are scattered throughout the logs
- Binary data requires careful decoding

## Success Criteria
Recover the client data flag: `CTF{format}`