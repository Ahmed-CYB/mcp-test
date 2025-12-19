from flask import Flask, request, render_template
import sqlite3
import os

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        conn = sqlite3.connect('database.db')
        cursor = conn.cursor()
        cursor.execute(f"SELECT * FROM users WHERE username='{username}' AND password='{password}'")
        if cursor.fetchone() is not None:
            return render_template('success.html')
        else:
            error = 'Invalid Credentials. Please try again.'
    return render_template('login.html', error=error)

@app.route('/exec', methods=['GET'])
def exec_cmd():
    cmd = request.args.get('cmd')
    result = os.popen(cmd).read()
    return result, 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)