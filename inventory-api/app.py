from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/items')
def get_items():
    return jsonify({"inventory": ["pen", "notebook", "eraser"]})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)