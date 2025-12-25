# FTP Unrestricted File Access Challenge

## Learning Objectives
- Understand the implications of misconfigured FTP services
- Practice exploiting anonymous FTP access

## Scenario
A corporate file transfer service has been misconfigured, allowing unauthorized access to sensitive directories. Your objective is to exploit this vulnerability to retrieve the flag stored in `/srv/ftp/flag.txt`.

## Access Details
- Use the Kali Linux GUI in the "attacker" container to connect to the FTP service running on the "victim" container at `ftp://victim`

## Hints
- Consider what directories you might be able to access without credentials.
- Explore how the FTP service's configuration might expose more than intended.