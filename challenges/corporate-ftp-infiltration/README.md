# corporate-ftp-infiltration

## Description
A corporate FTP server has been configured with weak security practices. The system administrator left default credentials and misconfigured anonymous access. Your task is to infiltrate the FTP server and retrieve the confidential document containing sensitive company data.

## Scenario
You are conducting a penetration test for Acme Corp. During reconnaissance, you discovered an FTP server running on their network. Intelligence suggests that the server contains classified financial reports. The system administrator is known for using default credentials and may have misconfigured anonymous access permissions.

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.119 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Start with a port scan to identify running services on the target machine.
2. FTP servers sometimes allow anonymous login - try connecting without credentials first.
3. If anonymous access works, explore the directory structure thoroughly. Some directories might have different permissions.
4. Look for files with interesting names like 'financial', 'confidential', or 'restricted' - they often contain valuable information.

## Flag Format
CTF{ftp_anonymous_access_is_dangerous_2024}
