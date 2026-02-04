# apache-cxf-sql-injection-challenge

## Description
A web application running Apache CXF with a vulnerable SQL injection endpoint. The application processes user input without proper sanitization, allowing attackers to manipulate database queries and extract sensitive information.

## Scenario
You've discovered a web service running Apache CXF that handles user authentication. The application appears to have a SQL injection vulnerability in its login functionality. Your goal is to exploit this vulnerability to retrieve the flag from the database.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.30.145.3 - ssh
- **victim** (victim): 172.30.145.61 - http, ssh

## Hints
1. The web application has a login endpoint that might not properly sanitize user input
2. Try testing the username and password parameters for SQL injection vulnerabilities
3. Look for ways to bypass authentication or extract data from the database using UNION-based injection

## Flag Format
CTF{...}
