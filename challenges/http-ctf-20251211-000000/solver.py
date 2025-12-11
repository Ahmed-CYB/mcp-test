#!/usr/bin/env python3
import requests

URL = "http://localhost:18080/"

def solve():
    # Placeholder solver
    r = requests.get(URL, params={"q": "test"})
    print("Status:", r.status_code)

if __name__ == "__main__":
    solve()
