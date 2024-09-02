FROM python:3.10-alpine

WORKDIR /app

COPY requirements.txt requirements.txt

RUN mkdir /app/todolist

RUN mkdir /app/todolist/templates

COPY __init__.py todolist/__init__.py

COPY base.html todolist/templates/base.html

COPY wsgi.py wsgi.py

RUN pip install -r requirements.txt

CMD [ "gunicorn", "--workers", "2",  "--bind", "0.0.0.0", "wsgi:app" ]
