# sql-injection-challenge

## Description
A vulnerable web application with SQL injection in the user lookup. Find and exploit the injection to extract the flag from the database.

## Scenario
You have access to a simple user lookup page. The backend builds SQL from your input without sanitization. Use SQL injection to dump the secrets table and capture the flag.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.26.145.3 - ssh
- **victim** (victim): 172.26.145.73 - http, ssh
## Victim credentials
- **victim**: `victim` / `admin`

## Hints
1. The user parameter is reflected in a SQL query.
2. Try a single quote to break the query and see an error.
3. Use UNION SELECT to read from another table.
4. The flag is stored in a table named secrets.

## Flag Format
CTF{...}

