#!/usr/bin/env python3
import requests

def main():
    url = "http://localhost:8080/"
    print("Solver placeholder hitting", url)
    try:
        r = requests.get(url)
        print(r.text[:200])
    except Exception as e:
        print("Error:", e)

if __name__ == "__main__":
    main()
