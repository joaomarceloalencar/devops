FROM python:3.10-alpine

WORKDIR /app

RUN apk update && apk add gcc && apk add build-base && apk add linux-headers

COPY requirements.txt requirements.txt

RUN mkdir /app/showip

COPY __init__.py showip/__init__.py

COPY wsgi.py wsgi.py

RUN pip install -r requirements.txt

CMD [ "gunicorn", "--workers", "2",  "--bind", "0.0.0.0", "wsgi:app" ]
