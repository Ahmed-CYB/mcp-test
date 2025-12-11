import requests

# Placeholder solver script for HTTP challenge
# Implement exploitation steps here once challenge details are finalized.

def main():
    target = "http://localhost:8080/"
    r = requests.get(target, params={"name": "tester"})
    print(r.text)

if __name__ == "__main__":
    main()
