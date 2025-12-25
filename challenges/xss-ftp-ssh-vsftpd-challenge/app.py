# Main application
# Vulnerable to: XSS
from flask import Flask, render_template, request
import logging

app = Flask(__name__)

# Configure logging
logging.basicConfig(level=logging.DEBUG)

@app.route('/', methods=['GET', 'POST'])
def index():
    feedback = request.args.get('feedback', '')
    if request.method == 'POST':
        name = request.form.get('name', '')
        feedback = request.form.get('feedback', '')
        # Log feedback
        app.logger.info('Received feedback: %s', feedback)
        return render_template('index.html', name=name, feedback=feedback)
    return render_template('index.html', feedback=feedback)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
