# ftp-anonymous-network-discovery

## Description
A multi-target network contains several FTP servers with anonymous access enabled. Your task is to discover all FTP servers on the network, access them anonymously, and retrieve flags from each server. This challenge teaches network scanning, FTP enumeration, and anonymous FTP exploitation across multiple targets.

## Scenario
You've gained access to a corporate network segment that contains multiple file servers. Intelligence suggests that several FTP servers have been misconfigured with anonymous access enabled, potentially exposing sensitive data. Your mission is to scan the network, identify all FTP servers, and retrieve any flags that may be stored on these systems.

## Difficulty
easy

## Machines
- **attacker** (attacker): 172.21.145.3 - ssh
- **victim1** (victim): 172.21.145.48 - ftp, ssh
- **victim2** (victim): 172.21.145.43 - ftp, ssh
- **victim3** (victim): 172.21.145.189 - ftp, ssh

## Hints
1. Start by scanning the network to discover all active hosts and their open ports
2. Look for FTP servers running on port 21 - try connecting with anonymous credentials
3. Use 'ls -la' and 'cd' commands in FTP to navigate directories and find hidden files

## Flag Format
CTF{...}
