# Main application
# Vulnerable to: Port exposure
from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def index():
    return 'Welcome to the Nmap discovery challenge!'

@app.route('/hidden')
def hidden():
    # This page is supposed to be hidden and only accessible via direct URL
    return jsonify(flag=os.getenv('FLAG', 'CTF{nmap_discovery_success}'))

if __name__ == '__main__':
    # Run the app on port 8080, accessible from all interfaces
    app.run(host='0.0.0.0', port=8080)