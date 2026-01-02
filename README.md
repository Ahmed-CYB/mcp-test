# CTF Challenge Repository

This repository contains all CTF challenges created by the AI CTF Challenge Platform automation system.

## Repository Structure

```
challenges/
└── {challenge-name}/
    ├── docker-compose.yml      # Multi-container orchestration
    ├── metadata.json           # Challenge metadata
    ├── README.md              # Challenge description and instructions
    ├── Dockerfile             # Victim container configuration
    ├── attacker/
    │   └── Dockerfile.attacker # Attacker (Kali Linux) configuration
    └── {machine-name}/        # Additional victim machines (if multi-machine)
        └── Dockerfile
```

## Challenge Structure

Each challenge directory contains:

- **docker-compose.yml**: Defines all containers (victim, attacker, database, etc.) and their network configuration
- **metadata.json**: Challenge metadata including name, description, difficulty, category, flag, and hints
- **README.md**: Human-readable challenge description and learning objectives
- **Dockerfile(s)**: Container configurations for victim machines
- **attacker/Dockerfile.attacker**: Kali Linux attacker machine configuration

## Challenge Categories

- **Network**: FTP, SSH, SMB, Telnet, and other network protocol challenges
- **Web**: SQL injection, XSS, CSRF, and other web vulnerabilities
- **Crypto**: Encryption, encoding, hashing, and cipher challenges

## Automation

All challenges in this repository are automatically created, validated, and deployed by the CTF Challenge Platform automation system.

## Usage

Challenges are automatically deployed when requested through the platform's chat interface. Each challenge gets:
- Isolated Docker network with private IPs
- Kali Linux attacker machine with required tools
- Victim machine(s) with configured vulnerabilities
- Guacamole access for browser-based terminal access

## Notes

- Challenges use private IPs only (no port mappings)
- Each challenge gets a unique subnet (172.20-30.X.0/24)
- Attacker machine always at .3 IP address
- Victim machines at randomized IPs (.10-.200)
