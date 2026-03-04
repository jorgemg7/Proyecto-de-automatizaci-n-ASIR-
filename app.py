from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "Mi-App-AWS1 corriendo en AWS 🚀"

@app.route("/health")
def health():
    return jsonify(status="ok")

@app.route("/info")
def info():
    return jsonify(version="1.0.0")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
