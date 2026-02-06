# apache-cxf-sql-injection

## Description
A vulnerable Apache CXF web service with SQL injection vulnerability. The application uses dynamic SQL queries without proper input validation, allowing attackers to manipulate database queries and extract sensitive information.

## Scenario
You've discovered a corporate web service running Apache CXF that handles employee data queries. The service appears to have poor input validation on user search parameters. Your goal is to exploit the SQL injection vulnerability to retrieve the hidden flag from the database.

## Difficulty
medium

## Machines
- **attacker** (attacker): 172.21.145.3 - ssh
- **victim** (victim): 172.21.145.196 - http, mysql
## Victim credentials
- **victim**: `dev` / `playground`

## Hints
1. The web service accepts search parameters that might not be properly validated
2. Try testing the search functionality with SQL metacharacters like single quotes
3. The database contains a flags table with sensitive information

## Flag Format
CTF{...}

