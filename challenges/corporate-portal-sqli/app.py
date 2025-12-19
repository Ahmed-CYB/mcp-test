# Main application
from flask import Flask, render_template, request, redirect, url_for, flash
import sqlite3
import os

app = Flask(__name__)
app.secret_key = os.urandom(24)

DATABASE = 'corporate.db'

# Ensure the database is initialized
conn = sqlite3.connect(DATABASE)
cursor = conn.cursor()
cursor.execute('''
CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL
);
''')

# Insert a default user for testing
cursor.execute("INSERT OR IGNORE INTO users (username, password) VALUES ('admin', 'admin');")
conn.commit()
conn.close()

@app.route('/', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # Vulnerable SQL query
        conn = sqlite3.connect(DATABASE)
        cursor = conn.cursor()
        query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}';"
        
        # Log the query for debugging
        app.logger.debug(f'SQL Query: {query}')
        
        cursor.execute(query)
        user = cursor.fetchone()
        conn.close()

        if user:
            return redirect(url_for('success'))
        else:
            error = 'Invalid Credentials. Please try again.'
            flash(error)

    return render_template('index.html', error=error)

@app.route('/success')
def success():
    return render_template('success.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
