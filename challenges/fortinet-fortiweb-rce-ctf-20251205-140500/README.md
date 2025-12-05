# Fortinet FortiWeb Unauthenticated RCE CTF

**Challenge Level:** Hard

## Background

In this challenge, you are an operator for a cybersecurity firm monitoring network security through web application firewalls. Overnight, a series of failed protection logs reveals a potential vulnerability in the Fortinet FortiWeb appliance.

A hidden attack vector allows unauthenticated adversaries to execute commands on the appliance. Your mission is to exploit these vulnerabilities and demonstrate complete system compromise.

## Vulnerabilities

- CVE-2025-64446: Path traversal leads to unauthorized admin user creation.
- CVE-2025-58034: Authenticated command injection vulnerability enables arbitrary command execution at root level.

## Objective

Your mission is to breach the FortiWeb appliance and plant your flag in the `/root/flag.txt` file.

## Instructions

### Environment Setup:

1. Build the Docker image: `docker build -t fortinet-fortiweb-rce .`
2. Run the Docker container: `docker run -d -p 80:80 fortinet-fortiweb-rce`

### Exploitation Steps:

1. Use the Metasploit module:
    - **Path:** `exploit/linux/http/fortinet_fortiweb_rce`
    - **Required Options:**
        - RHOSTS: Target IP 
        - RPORT: 80 
        - PAYLOAD: `cmd/unix/reverse_bash`

2. Execute the module in Metasploit to gain a shell.

3. Locate and read `/root/flag.txt`.

## Hints

- Check for open network ports and services.
- Make sure your payload can handle a command injection attack targeting a bash shell.

## Note

This challenge is inspired by Rapid7's Metasploit updates as of late 2025 on Fortinet vulnerabilities, focusing on emphasizing attack vectors in enterprise security devices.