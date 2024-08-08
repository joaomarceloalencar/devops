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

Vamos considerar os comandos abaixo executados como _root_. Assuma o usuário com o comando _sudo su - root_:

```bash
apt-get update
apt-get -y install python3-venv python3-pip python3-dev build-essential libssl-dev libffi-dev python3-setuptools nginx
mkdir /todolist
cd /todolist
python3 -m venv venv
. venv/bin/activate
pip install wheel
pip install gunicorn Flask Flask-SQLAlchemy
git clone https://github.com/joaomarceloalencar/devops
cp /todolist/devops/Laboratorios/01_Flask/conf/todolist.service /etc/systemd/system/
chown ubuntu:www-data /todolist/devops/Laboratorios/01_Flask/src
systemctl start todolist
systemctl enable todolist 
cp /todolist/devops/Laboratorios/01_Flask/conf/todolist /etc/nginx/sites-available/
rm /etc/nginx/sites-enabled/default
systemctl restart nginx
```
