# Flask application for SQL Injection challenge
from flask import Flask, request, render_template, redirect, url_for
import sqlite3

app = Flask(__name__)

# Connect to the database
DATABASE = 'database.db'

def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/', methods=['GET', 'POST'])
def index():
    error = None
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        conn = get_db_connection()
        query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
        user = conn.execute(query).fetchone()
        conn.close()
        if user:
            return redirect(url_for('success'))
        else:
            error = 'Invalid credentials!'
    return render_template('index.html', error=error)

@app.route('/success')
def success():
    return "<h2>Welcome to the internal portal! Flag: CTF{sql_injection_success}</h2>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)