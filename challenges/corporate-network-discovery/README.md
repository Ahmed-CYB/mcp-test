# corporate-network-discovery

## Description
You've gained initial access to a corporate network. Your task is to discover and compromise multiple systems across the network infrastructure. Each system contains valuable intelligence that must be retrieved to complete your mission.

## Scenario
As a penetration tester, you've been hired to assess the security of MegaCorp's internal network. You have access to their internal network segment and need to identify all accessible systems, enumerate their services, and extract sensitive information from each target. The company runs a mixed environment with different services on various Linux distributions.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **web-server** (victim): 172.25.145.94 - http, ssh
- **ftp-server** (victim): 172.25.145.185 - ftp, ssh
- **file-server** (victim): 172.25.145.93 - samba, ssh
- **database-server** (victim): 172.25.145.152 - mysql, ssh
## Victim credentials
- **web-server**: `challenge` / `Ch@ngeMe`
- **ftp-server**: `ctfuser` / `toor`
- **file-server**: `player` / `playground`
- **database-server**: `admin` / `redteam`

## Hints
1. Start with a comprehensive network scan to identify all active hosts and their open ports
2. Each service may have different access controls - try anonymous/guest access where available
3. Some services might have default or weak credentials that haven't been changed

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

