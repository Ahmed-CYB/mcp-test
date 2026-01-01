#!/usr/bin/env python3
# Network Discovery Script for Corporate Penetration Test
# Usage: python3 discovery_script.py <target_range>

import subprocess
import sys
import json

def run_nmap_scan(target):
    # Basic host discovery
    print(f"Running host discovery on {target}...")
    result = subprocess.run(['nmap', '-sn', target], capture_output=True, text=True)
    print(result.stdout)
    
    # Service detection on discovered hosts
    print(f"Running service detection...")
    result = subprocess.run(['nmap', '-sV', '-sC', '-p-', target], capture_output=True, text=True)
    print(result.stdout)

def enumerate_services(host):
    # HTTP enumeration
    print(f"Enumerating HTTP services on {host}...")
    subprocess.run(['curl', '-s', f'http://{host}/server-status'], capture_output=False)
    
    # DNS enumeration
    print(f"Enumerating DNS on {host}...")
    subprocess.run(['dig', '@' + host, 'corporate.local', 'ANY'], capture_output=False)
    
    # SSH banner grab
    print(f"Getting SSH banner from {host}...")
    subprocess.run(['nc', host, '22'], input='\n', text=True, timeout=5, capture_output=False)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 discovery_script.py <target_range>")
        sys.exit(1)
    
    target = sys.argv[1]
    run_nmap_scan(target)
    
    # Example enumeration for specific host
    enumerate_services('192.168.1.10')