from flask import Flask, request, render_template_string

app = Flask(__name__)

TEMPLATE = """
<html>
  <body>
    <h1>Debug Echo</h1>
    <form method='GET'>
      <input type='text' name='q' placeholder='Say something'>
      <input type='submit'>
    </form>
    <div>
      {% if q %}
        <p>You said: {{ q }}</p>
      {% endif %}
    </div>
  </body>
</html>
"""

@app.route("/")
def index():
    q = request.args.get("q", "")
    return render_template_string(TEMPLATE, q=q)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
