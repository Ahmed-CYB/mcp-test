from flask import Flask, render_template, request
import os

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('query', '')
    # Vulnerable to reflected XSS
    return render_template('search.html', query=query)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
