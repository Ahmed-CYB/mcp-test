# Vulnerable to: Open ports scanning
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/hidden')
def hidden():
    return "CTF{nmap_found_me}"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)