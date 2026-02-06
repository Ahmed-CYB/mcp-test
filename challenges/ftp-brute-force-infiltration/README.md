# ftp-brute-force-infiltration

## Description
A corporate FTP server has been configured with weak authentication. Multiple user accounts exist on the system, but their passwords follow predictable patterns. Your task is to identify valid credentials through systematic brute force attacks and retrieve the sensitive flag file.

## Scenario
During a penetration test of TechCorp's infrastructure, you've discovered an FTP server running on the network. Initial reconnaissance suggests the system administrator has created several user accounts with weak passwords following common corporate naming conventions. The flag containing sensitive corporate data is hidden somewhere in the FTP directory structure, accessible only to authenticated users.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.23.145.3 - ssh
- **ftp-server** (victim): 172.23.145.41 - ftp, ssh
## Victim credentials (brute force)
- **Username to use**: `demo`
- **Wordlist on attacker machine**: `/usr/share/wordlists/rockyou.txt` (ensure it exists; on Kali it may be `rockyou.txt.gz` — decompress with `gunzip -k /usr/share/wordlists/rockyou.txt.gz` if needed).
Find the password using the wordlist above (e.g. with Hydra or Medusa).

## Hints
1. Start by scanning the target to identify open services and their versions
2. Common corporate usernames often include: admin, manager, support, guest, backup
3. Weak passwords frequently follow patterns like username123, password, or include the current year
4. Use a targeted wordlist with common corporate passwords and username variations

## Flag Format
CTF{...}

