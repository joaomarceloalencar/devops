# Aplicação Python Todo List

Fonte original: [Tutorial](https://www.python-engineer.com/posts/flask-todo-app/)

## Comandos Para Configuração em Ambiente de Desenvolvimento

Na pasta do usuário comum:

```bash
sudo apt-get update
sudo apt-get -y install python3-venv
mkdir myproject
cd myproject
python3 -m venv venv
. venv/bin/activate
pip install Flask
pip install Flask-SQLAlchemy
git clone https://github.com/joaomarceloalencar/devops
cd devops/Laboratorios/01_Flask
python3 src/todolist.py
```

## Comandos Para Configuração em Ambiente de Produção

Vamos considerar os comandos abaixo executados como _root_, prefixando com _sudo_:

```bash
apt-get update
apt-get -y install python3-venv python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools
mkdir /todolist
cd /todolist
python3 -m venv venv
. venv/bin/activate
pip install wheel
pip install gunicorn Flask Flask-SQLAlchemy
git clone https://github.com/joaomarceloalencar/devops

```
