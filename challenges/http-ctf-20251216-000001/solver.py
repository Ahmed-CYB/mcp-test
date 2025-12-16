import requests

# Basic solver template; user can extend based on challenge specifics.

def main():
    import os
    base_url = os.environ.get("CHALLENGE_URL", "http://localhost:8080")
    r = requests.get(base_url)
    print("Status:", r.status_code)
    print("Body (truncated):", r.text[:200])

if __name__ == "__main__":
    main()
