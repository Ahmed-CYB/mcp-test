# apache-cxf-sql-injection-challenge

## Description
A vulnerable Apache CXF web service contains a SQL injection vulnerability in its user authentication endpoint. Exploit the vulnerability to extract sensitive data from the database and retrieve the flag.

## Scenario
You've discovered a web service running Apache CXF that handles user authentication. The service appears to be vulnerable to SQL injection attacks. Your mission is to exploit this vulnerability to gain unauthorized access to the database and retrieve the hidden flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **victim** (victim): 172.30.145.18 - http, ssh
## Victim credentials
- **victim**: `runner` / `secret`

## Hints
1. The web service has multiple endpoints - explore them to understand the application structure
2. Look for authentication endpoints that might be vulnerable to SQL injection attacks
3. Try using SQL injection techniques like UNION queries or boolean-based attacks to extract data
4. The admin user has special privileges that might reveal the flag location

## Flag Format
CTF{...}

