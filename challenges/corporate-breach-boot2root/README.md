# corporate-breach-boot2root

## Description
You've been hired to test the security of CyberCorp's internal network. Intelligence suggests they're running outdated services with known vulnerabilities. Your goal is to gain initial access, escalate privileges, and capture the root flag. This is a multi-stage boot2root challenge requiring reconnaissance, exploitation, and privilege escalation.

## Scenario
CyberCorp recently hired you as a penetration tester after rumors of security vulnerabilities in their network. You've been given access to their internal network segment and tasked with demonstrating a complete compromise. The company runs various services for file sharing and remote access. Your mission: achieve root access and prove the extent of the security breach.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.20.145.3 - ssh
- **cybercorp-server** (victim): 172.20.145.87 - samba, ssh, ftp
## Victim credentials
- **cybercorp-server**: `runner` / `playground`

## Hints
1. Start with a comprehensive network scan to identify all running services and their versions
2. Anonymous SMB access might reveal interesting files and user information for further attacks
3. Weak credentials are often reused across multiple services - try common username/password combinations
4. Check what commands users can run with sudo privileges - some binaries can be exploited for privilege escalation

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

