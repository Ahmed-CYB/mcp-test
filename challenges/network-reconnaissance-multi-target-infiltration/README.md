# network-reconnaissance-multi-target-infiltration

## Description
You've completed your initial network scan and discovered multiple targets with various services. Your mission is to systematically infiltrate each target system and extract the classified flags. Each target has different vulnerabilities and requires different attack vectors.

## Scenario
As a penetration tester, you've been hired to assess the security of a corporate network. Your nmap scan revealed multiple systems with different services running. You must now perform detailed reconnaissance, identify vulnerabilities, and extract flags from each compromised system to demonstrate the security gaps.

## Difficulty
hard

## Machines
- **attacker** (attacker): 172.26.145.3 - ssh
- **victim1** (victim): 172.26.145.95 - ftp, ssh
- **victim2** (victim): 172.26.145.125 - http, ssh
- **victim3** (victim): 172.26.145.70 - samba, ssh
- **victim4** (victim): 172.26.145.46 - samba, ssh
## Victim credentials (brute force)
- **Username to use**: `test`
- **Wordlist on attacker machine**: `/usr/share/wordlists/rockyou.txt` (ensure it exists; on Kali it may be `rockyou.txt.gz` — decompress with `gunzip -k /usr/share/wordlists/rockyou.txt.gz` if needed).
Find the password using the wordlist above (e.g. with Hydra or Medusa).

## Hints
1. Start with detailed service enumeration on each discovered host
2. Some services allow anonymous access while others might have weak credentials
3. SMB shares often contain sensitive information - enumerate them thoroughly
4. Web servers might have interesting directories that aren't immediately visible

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

