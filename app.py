from flask import Flask

app = Flask(__name__)

@app.route("/python")
def hello():
    return "Hello, my name is Raihanmd now im learning from Dicoding!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
