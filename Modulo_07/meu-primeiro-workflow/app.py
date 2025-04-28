# app.py
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    """Retorna uma saudação simples."""
    return 'Olá, Mundo DevOps com Flask e GitHub Actions!'


if __name__ == '__main__':
    app.run(debug=True)
