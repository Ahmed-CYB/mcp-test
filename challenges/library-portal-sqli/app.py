# Main application
# Vulnerable to: SQL Injection
from flask import Flask, render_template, request
import sqlite3
import os

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('query')
    conn = get_db_connection()
    cur = conn.cursor()
    # WARNING: This line is vulnerable to SQL Injection
    cur.execute(f"SELECT * FROM books WHERE title LIKE '%{query}%' OR author LIKE '%{query}%'")
    books = cur.fetchall()
    conn.close()
    return render_template('search.html', books=books)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
