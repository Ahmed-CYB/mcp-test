# network-discovery-multi-target

## Description
A corporate network has been compromised and multiple systems are running vulnerable services. Use network scanning techniques to discover all targets, identify their services, and retrieve the flags from each compromised system.

## Scenario
You are a penetration tester hired to assess the security of TechCorp's internal network. Intelligence suggests that multiple servers are running with misconfigurations and weak security controls. Your task is to discover all active hosts, identify their services, and demonstrate the security flaws by retrieving sensitive data from each target.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **web-server** (victim): 172.25.145.27 - http, ssh
- **ftp-server** (victim): 172.25.145.144 - ftp, ssh
- **smb-server** (victim): 172.25.145.26 - samba, ssh
- **database-server** (victim): 172.25.145.139 - mysql, ssh
## Victim credentials
- **web-server**: `runner` / `ctf2024`
- **ftp-server**: `challenge` / `p@ssw0rd`
- **smb-server**: `appuser` / `letmein`
- **database-server**: `appuser` / `access`

## Hints
1. Start with a comprehensive network scan to discover all active hosts and their open ports
2. Each service has different access methods - some allow anonymous access, others have weak authentication
3. Check for common service misconfigurations like anonymous FTP, guest SMB shares, and passwordless databases

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

