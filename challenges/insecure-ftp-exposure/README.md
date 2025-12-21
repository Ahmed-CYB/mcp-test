# Insecure FTP Exposure Challenge

## Scenario
A company set up an FTP server for internal file sharing but misconfigured permissions. Your task is to exploit this misconfiguration to access sensitive files.

## Objective
Access the FTP server and retrieve the flag located in `/srv/ftp/flag.txt`.

## Hints
1. Explore open directories on the FTP server.
2. Anonymous FTP might be a clue.
3. Look for files that should not be publicly accessible.

## Learning Objectives
- Understand FTP server configurations.
- Learn about common misconfigurations in FTP services.
- Practice exploiting unsecured FTP access.

Access the victim FTP server at `ftp://victim:21` from the attacker container.
