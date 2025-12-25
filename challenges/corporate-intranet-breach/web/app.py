# Main application
# Vulnerable to: XSS
from flask import Flask, render_template, request, redirect, url_for
import os

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        search_query = request.form.get('query')
        return render_template('index.html', search_query=search_query)
    return render_template('index.html')

@app.route('/ftp', methods=['GET'])
def ftp_info():
    # This route leaks FTP credentials
    ftp_host = os.getenv('FTP_HOST', '172.25.0.20')
    return f'The FTP server is located at {ftp_host}.'

@app.route('/ssh', methods=['GET'])
def ssh_info():
    # This route leaks SSH information
    ssh_host = os.getenv('SSH_HOST', '172.25.0.30')
    return f'The SSH server is located at {ssh_host}.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)