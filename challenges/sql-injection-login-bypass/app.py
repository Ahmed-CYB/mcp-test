# Main application
# Vulnerable to: SQL Injection
from flask import Flask, request, render_template, g
import sqlite3
import os

app = Flask(__name__)
DATABASE = '/tmp/test.db'

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']
    conn = get_db()
    query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}';"
    cur = conn.execute(query)
    user = cur.fetchone()
    if user:
        return f'Welcome, {user['username']}! Flag: CTF{sql_injection_bypass}'
    else:
        return 'Invalid credentials!'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

if __name__ == '__main__':
    with app.app_context():
        init_db()
    app.run(host='0.0.0.0', port=8080)

def init_db():
    with app.app_context():
        db = get_db()
        with app.open_resource('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()
