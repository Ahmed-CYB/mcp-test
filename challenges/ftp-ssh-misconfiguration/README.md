# FTP and SSH Misconfiguration Challenge

## Learning Objectives
- Understand security implications of FTP service misconfigurations
- Analyze and exploit SSH configurations
- Identify potential information leaks through improperly configured services

## Scenario
A company has set up an FTP service for file transfers, but due to a misconfiguration, sensitive information may be leaking. Additionally, their SSH configuration might expose a vulnerability. Your task is to find and exploit these misconfigurations to capture the flag.

## Instructions
1. Access the FTP service at ftp://ftp:21 and the SSH service at ssh:22.
2. Investigate potential misconfigurations in both services.
3. Exploit the vulnerabilities to retrieve the flag.
4. The flag is in the SSH service due to a misconfiguration but was initially hinted at through the FTP service.

## Hints
1. Investigate the permissions set on the FTP server.
2. Look into the SSH configuration to find potential weaknesses.
3. The SSH root login may be the key to finding the flag.

## Accessing Services
- FTP: ftp://ftp:21
- SSH: ssh://ssh:22
- Use the Kali Linux container to perform your attacks (hostname: attacker).
