import os
import signal
from flask import Flask, render_template
from buzz import generator

app = Flask(__name__, template_folder='src/templates/')

signal.signal(signal.SIGINT, lambda s, f: os._exit(0))

@app.route("/")
def generate_buzz():
    buzz = generator.generate_buzz()
    print(os.getcwd())
    print(os.listdir('./'))
    print(os.path.realpath(__file__))
    return render_template('index.html', buzz=buzz)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(os.getenv('PORT', 5000)))