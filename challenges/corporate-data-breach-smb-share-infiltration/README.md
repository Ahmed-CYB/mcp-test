# Corporate Data Breach: SMB Share Infiltration

## Scenario Description

A corporate file server has been misconfigured, exposing sensitive SMB shares. Intelligence suggests that confidential data including encrypted personnel files are accessible through anonymous or weak authentication. Your mission is to infiltrate the SMB service, navigate the share structure, and recover the encrypted flag containing critical corporate secrets.

## Challenge Information

- **Categories:** network, crypto
- **Machines:** 2
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| corporate-fileserver | victim | 172.23.193.47 | smb, netbios-ns, netbios-ssn |
| attacker-workstation | attacker | 172.23.193.3 | ssh |

## Challenge Stages

### Stage 1

SMB service discovery and enumeration using network scanning tools

### Stage 2

Share enumeration to identify accessible directories and permission levels

### Stage 3

File system traversal to locate sensitive documents and configuration files

### Stage 4

Recovery of encryption keys from misplaced configuration files

### Stage 5

Decryption of the final flag using discovered cryptographic materials

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
- Cryptographic analysis and decryption techniques
