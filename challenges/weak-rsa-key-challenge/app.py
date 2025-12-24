# Main application
# Vulnerable to: Weak RSA Key
from flask import Flask, render_template, request
import rsa
import os

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/message')
def message():
    public_key, private_key = rsa.newkeys(512)  # Intentionally weak keys
    message = 'This is a secret message!'
    encrypted_message = rsa.encrypt(message.encode(), public_key)
    return {'public_key': {'n': public_key.n, 'e': public_key.e}, 'encrypted_message': encrypted_message.hex()}

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
