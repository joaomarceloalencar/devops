# Aplicação Python Todo List

Fonte original: [Tutorial](https://www.python-engineer.com/posts/flask-todo-app/)

## Comandos Para Configuração em Ambiente de Desenvolvimento

Estas etapas correspondem a utilizar a instância na AWS como ambiente de desenvolvimento, acessando-a pelo _Visual Studio Code_. Na pasta do usuário comum:

Primeiro, atualizar os pacotes e instalar o pacote _venv_ do _Python_.
```bash
sudo apt-get update
sudo apt-get -y install python3-venv
```

Vamos criar um diretório e criar um ambiente _Python_ para instalar as dependências.
```bash
mkdir todolist
cd todolist
python3 -m venv venv
```

Em seguida, ativamos o ambiente e instalamos as dependências:
```bash
. venv/bin/activate
pip install Flask
pip install Flask-SQLAlchemy
```
Por fim, clonamos o repositório e executamos a aplicação em modo de desenvolvimento:

```bash
git clone https://github.com/joaomarceloalencar/devops
cd devops/Laboratorios/01_Flask
python3 src/todolist.py
```

## Comandos Para Configuração em Ambiente de Produção

Fonte original: [Tutorial](https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-gunicorn-and-nginx-on-ubuntu-20-04-pt)


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
chown ubuntu:www-data /todolist/devops/Laboratorios/01_Flask/src
cp /todolist/devops/Laboratorios/01_Flask/conf/todolist.service /etc/systemd/system/
systemctl start todolist
systemctl enable todolist 
cp /todolist/devops/Laboratorios/01_Flask/conf/todolist /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/todolist /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
systemctl restart nginx
```
