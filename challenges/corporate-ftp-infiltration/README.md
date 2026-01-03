# corporate-ftp-infiltration

## Description
A corporate FTP server has been misconfigured, allowing unauthorized access to sensitive company data. Your task is to identify the vulnerability, gain access to the server, and retrieve the confidential flag hidden in the corporate directory structure.

## Scenario
SecureCorp recently set up an FTP server for file sharing between departments. The system administrator, rushing to meet a deadline, made several configuration mistakes that left the server vulnerable. Intelligence suggests that sensitive corporate documents, including the flag, are stored in a restricted directory. Can you exploit the misconfigurations to access the confidential data?

## Difficulty
medium

## Machines
- **ftp-server** (victim): 172.24.193.83 - ftp
- **attacker** (attacker): 172.24.193.3 - 

## Hints
1. Anonymous FTP access might be enabled - try connecting without credentials
2. Look for symbolic links or unusual directory structures that might provide access to restricted areas
3. The corporate directory contains multiple subdirectories - explore them systematically to find the confidential data

## Flag Format
CTF{ftp_m1sc0nf1g_l34ds_t0_d4t4_br34ch}
