# apache-cxf-xxe-deserialization

## Description
A vulnerable Apache CXF web service is running with XXE and deserialization vulnerabilities. Your task is to exploit these vulnerabilities to retrieve the flag from the system.

## Scenario
You've discovered a web service running Apache CXF that appears to process XML requests. The service seems to have improper input validation and may be vulnerable to XML External Entity (XXE) attacks and unsafe deserialization. Your goal is to exploit these vulnerabilities to gain access to sensitive information.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.25.145.3 - ssh
- **victim** (victim): 172.25.145.115 - http, ssh
## Victim credentials
- **victim**: `appuser` / `p@ssw0rd`

## Hints
1. The web service accepts XML requests and may not properly validate external entities
2. Look for SOAP endpoints that process XML data with dangerous configurations
3. The flag might be accessible through file system access via XXE vulnerability

## Flag Format
CTF{...}

