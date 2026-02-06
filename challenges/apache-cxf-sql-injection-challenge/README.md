# apache-cxf-sql-injection-challenge

## Description
A vulnerable Apache CXF web service contains SQL injection vulnerabilities in its user authentication and data retrieval endpoints. Exploit these vulnerabilities to extract sensitive information from the database and capture the flag.

## Scenario
You've discovered a corporate web service running Apache CXF that handles employee data. The application appears to have SQL injection vulnerabilities in its login and search functionality. Your goal is to exploit these vulnerabilities to access the database and retrieve the hidden flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **victim** (victim): 172.30.145.144 - http, mysql
## Victim credentials
- **victim**: `admin` / `p@ssw0rd`

## Hints
1. The web application has two main endpoints that accept user input
2. Try testing both the login form and search functionality for SQL injection vulnerabilities
3. Use UNION-based injection to extract data from other tables, including the secrets table
4. Once you gain admin access, look for hints about where sensitive files might be stored

## Flag Format
CTF{...}

