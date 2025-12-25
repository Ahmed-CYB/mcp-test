from flask import Flask, request, render_template
import sqlite3
import os

app = Flask(__name__)
DATABASE = 'database.db'

@app.route('/', methods=['GET', 'POST'])
def index():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if authenticate(username, password):
            return 'Welcome back! Flag is in /var/www/html/flag.txt'
        else:
            error = 'Invalid credentials'
    return render_template('index.html', error=error)

def authenticate(username, password):
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()
    query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
    cursor.execute(query)
    user = cursor.fetchone()
    conn.close()
    return user is not None

if __name__ == '__main__':
    if not os.path.exists(DATABASE):
        conn = sqlite3.connect(DATABASE)
        cursor = conn.cursor()
        cursor.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)')
        cursor.execute('INSERT INTO users (username, password) VALUES (?, ?)', ('admin', 'adminpass'))
        conn.commit()
        conn.close()
    app.run(host='0.0.0.0', port=8080)
