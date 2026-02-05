# network-discovery-multi-target

## Description
A comprehensive network scanning challenge featuring multiple victim machines with different vulnerable services. Use nmap to discover services, identify vulnerabilities, and capture flags from each target system. This challenge simulates a realistic penetration testing scenario where you must systematically scan and exploit multiple hosts in a network.

## Scenario
You've gained access to a corporate network and need to perform reconnaissance on multiple servers. Each server runs different services with various security misconfigurations. Your goal is to scan the network, identify all running services, and exploit vulnerabilities to capture flags from each target machine. The network contains a web server, FTP server, and file sharing server - each with different weaknesses to discover.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **victim1** (victim): 172.25.145.121 - http, ssh
- **victim2** (victim): 172.25.145.160 - ftp, ssh
- **victim3** (victim): 172.25.145.120 - samba, ssh
## Victim credentials
- **victim1**: `dev` / `secret`
- **victim2**: `challenge` / `welcome`
- **victim3**: `appuser` / `welcome`

## Hints
1. Start with a comprehensive nmap scan to discover all hosts and services in the network
2. Each service has different access methods - try anonymous access, guest accounts, and directory traversal
3. Look for accessible directories and shares that might contain sensitive files

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

