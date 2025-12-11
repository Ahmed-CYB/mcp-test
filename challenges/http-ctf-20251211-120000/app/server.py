from flask import Flask, request, render_template_string
import os

app = Flask(__name__)

@app.route("/")
def index():
    name = request.args.get("name", "guest")
    template = """
    <html>
      <body>
        <h1>Hello {{ name }}</h1>
      </body>
    </html>
    """
    return render_template_string(template, name=name)

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
