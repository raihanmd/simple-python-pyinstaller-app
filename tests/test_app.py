import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_hello(client):
    response = client.get("/python")
    assert response.status_code == 200
    assert response.data == b"Hello, my name is Raihanmd!"
