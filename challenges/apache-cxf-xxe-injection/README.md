# apache-cxf-xxe-injection

## Description
Exploit an XXE (XML External Entity) injection vulnerability in Apache CXF web service to retrieve sensitive information from the server filesystem.

## Scenario
A company has deployed an Apache CXF SOAP web service for internal document processing. The service accepts XML input but lacks proper security controls, making it vulnerable to XXE injection attacks. Your task is to exploit this vulnerability to access sensitive files on the server.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.26.145.3 - ssh
- **victim** (victim): 172.26.145.190 - http, ssh

## Hints
1. The web service processes XML documents - look for XML parsing functionality
2. Try crafting XML payloads with external entity references to read local files
3. The flag is located in /root/flag.txt - use XXE to retrieve it via file:// protocol

## Flag Format
CTF{...}
