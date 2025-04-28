# tests/test_app.py
import pytest
from app import app as flask_app   # Importa a instância da app Flask


@pytest.fixture
def app():
    """Cria uma instância da app Flask para testes."""
    yield flask_app


@pytest.fixture
def client(app):
    """Cria um cliente de teste para a app Flask."""
    return app.test_client()


def test_hello_world(client):
    """Testa se a rota principal ('/')
    retorna status 200 e contém a saudação."""
    response = client.get('/')
    assert response.status_code == 200
    # Usando bytes e codificação correta para 'Olá'
    assert b'Ol\xc3\xa1, Mundo DevOps' in response.data
