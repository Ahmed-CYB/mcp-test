# corporate-data-breach

## Description
TechCorp's internal employee portal has been compromised. Intelligence suggests that sensitive employee data including salary information has been exposed through a SQL injection vulnerability. Your mission is to infiltrate their database and retrieve the confidential flag containing the CEO's personal information.

## Scenario
You are a security consultant hired to test TechCorp's web application security. The company recently deployed an employee portal at http://target-ip/portal/ that allows employees to view their profiles. However, the development team rushed the deployment and may have left security vulnerabilities. Your goal is to find and exploit any SQL injection vulnerabilities to access restricted data.

## Difficulty
medium

## Machines
- **techcorp-portal** (victim): 172.25.195.153 - http
- **attacker** (attacker): 172.25.195.3 - 

## Hints
1. The login form might not properly sanitize user input
2. Try using SQL injection techniques on the login parameters
3. Look for ways to extract data from other database tables using UNION queries

## Flag Format
CTF{sql_1nj3ct10n_m4st3r_2024}
