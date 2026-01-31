# corporate-data-breach

## Description
A corporate employee portal has been discovered with potential security vulnerabilities. The application appears to use a database backend for user authentication and data storage. Your mission is to exploit SQL injection vulnerabilities to extract sensitive information from the database.

## Scenario
TechCorp recently deployed a new employee management system accessible via web interface. Security audits revealed the application may be vulnerable to SQL injection attacks. As a penetration tester, you need to identify and exploit these vulnerabilities to demonstrate the risk to sensitive employee data stored in the backend database.

## Difficulty
medium

## Machines
- **web-server** (victim): 172.23.145.45 - apache2, mysql
- **attacker** (attacker): 172.23.145.3 - 

## Hints
1. The login form might not properly validate user input before sending it to the database.
2. Try using SQL injection techniques to bypass authentication. Consider what happens when you use special characters like single quotes.
3. Use UNION SELECT statements to extract data from other tables. The admin role might give you access to restricted areas.
4. Look for ways to access the admin panel. You might need to manipulate the SQL query to return administrator privileges.

## Flag Format
CTF{sql_1nj3ct10n_m4st3r_2024}
