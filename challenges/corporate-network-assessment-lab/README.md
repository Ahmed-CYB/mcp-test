# Corporate Network Assessment Lab

## Scenario Description

A simulated corporate environment with diverse systems requiring comprehensive network reconnaissance. Practice advanced nmap techniques across different operating systems and service configurations.

## Challenge Information

- **Categories:** network
- **Machines:** 5
- **Stages:** 5

## Network Architecture

| Machine | Type | IP Address | Services |
|---------|------|------------|----------|
| scanner-station | attacker | 172.26.193.3 | ssh |
| linux-web-server | victim | 172.26.193.178 | http, https, ssh, ftp, telnet, snmp, mysql |
| windows-file-server | victim | 172.26.193.11 | smb, rdp, winrm, dns, ldap, rpc |
| embedded-iot-device | victim | 172.26.193.12 | custom-8080, custom-9999, tftp, upnp, coap |
| legacy-unix-system | victim | 172.26.193.13 | rsh, finger, echo, daytime, chargen, custom-31337 |

## Challenge Stages

### Stage 1

Initial network discovery using ping sweeps and basic scans

### Stage 2

Service enumeration with version detection across all systems

### Stage 3

Advanced scanning techniques including stealth scans and OS fingerprinting

### Stage 4

Custom port discovery and service identification on unusual configurations

### Stage 5

Comprehensive reporting of all discovered services and potential vulnerabilities

## Getting Started

1. Access the attacker machine via Guacamole
2. Scan the network to identify target machines
3. Follow the scenario stages to progress
4. Capture the flag!

## Learning Objectives

- Network scanning and service exploitation
