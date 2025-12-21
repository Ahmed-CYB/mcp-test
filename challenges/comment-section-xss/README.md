# Comment Section XSS

## Learning Objectives
- Understand the impact of stored XSS vulnerabilities
- Learn how to inject JavaScript payloads into input fields
- Practice exploiting XSS to capture cookies using attacker-controlled scripts

## Scenario
A startup has developed a simple blog platform where users can comment on posts. However, they haven't implemented proper input sanitization in the comment section, leading to a potential XSS vulnerability. Can you exploit this vulnerability to capture the admin's session cookie?

## Deployment
- The web application is accessible at http://victim:8080
- Use the attacker machine (Kali Linux) to find and exploit vulnerabilities.

## Flag
The flag is: CTF{st0red_xss_vuln3rability}
