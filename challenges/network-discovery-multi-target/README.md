# network-discovery-multi-target

## Description
You are a penetration tester conducting a network assessment. Multiple systems on the target network are running various services with different vulnerabilities. Use network scanning techniques to discover all targets, identify running services, and capture flags from each compromised system.

## Scenario
A corporate network segment contains several servers with different services. Your task is to perform network reconnaissance, identify vulnerable services on each target, and extract sensitive information (flags) from all discovered systems. Each server may be running different services like web servers, file servers, or database services.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **web-server** (victim): 172.25.145.185 - http, ssh
- **ftp-server** (victim): 172.25.145.136 - ftp, ssh
- **smb-server** (victim): 172.25.145.177 - samba, ssh
- **database-server** (victim): 172.25.145.128 - mysql, ssh
## Victim credentials
- **web-server**: `admin` / `letmein`
- **ftp-server**: `box` / `secret`
- **smb-server**: `box` / `letmein`
- **database-server**: `box` / `access`

## Hints
1. Start with a comprehensive network scan to discover all active hosts and their open ports
2. Each service may have different authentication mechanisms - try anonymous/guest access first
3. Look for directory listings, default credentials, and misconfigured services on each target

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

