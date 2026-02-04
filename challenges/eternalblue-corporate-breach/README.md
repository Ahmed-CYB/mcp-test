# eternalblue-corporate-breach

## Description
A sophisticated penetration test against CyberCorp's internal network infrastructure. The target is a critical file server running SMB services with known vulnerabilities. Intelligence suggests the system may be susceptible to the infamous EternalBlue exploit (MS17-010). Your mission is to infiltrate the corporate network, exploit the SMB vulnerability, and retrieve sensitive backup files containing system keys.

## Scenario
You are conducting an authorized penetration test for CyberCorp, a multinational technology company. The IT department has reported suspicious network activity and wants you to assess their file server's security posture. The target server (192.168.1.100) hosts critical business data and backup files. Recent vulnerability scans indicate the presence of SMB services that may be vulnerable to the EternalBlue exploit. Your objective is to exploit this vulnerability and demonstrate the potential impact by retrieving the system backup key stored in the IT department's secure folder.

## Difficulty
hard

## Machines
- **kali-attacker** (attacker): 172.27.145.3 - ssh
- **fileserver** (victim): 172.27.145.163 - samba, ssh
## Victim credentials
Find valid credentials using common wordlists (e.g. rockyou.txt, user name lists). Services may accept weak or default credentials.

## Hints
1. Corporate networks often have legacy systems with outdated SMB configurations
2. The EternalBlue exploit targets a specific SMB vulnerability - check for SMB signing status and protocol versions
3. Use Metasploit's ms17_010_eternalblue module after confirming the target is vulnerable with auxiliary scanners

## Flag Format
CTF{...}

## Solution (Samba)

1. **Scan the victim** for SMB ports: `nmap -p 139,445 --open <victim_ip>`. (Port 139 = NetBIOS, 445 = SMB; both are normal for Samba.)
2. **List shares** (no password): `smbclient -L //<victim_ip> -N`. If you see "Protocol negotiation... SMB1" or "Unable to connect with SMB1", ignore it—the share list still succeeded. To avoid the message, use: `smbclient -L //<victim_ip> -N --option='client min protocol=SMB2'`.
3. **Connect to the share**: `smbclient //<victim_ip>/share -N`.
4. **List and get the flag**: `ls`, then `get flag.txt`, then `cat flag.txt` (or open it locally).

