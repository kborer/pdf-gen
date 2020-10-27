FROM python:3

RUN mkdir /code
WORKDIR /code
COPY . .

RUN pip install -r requirements.txt

CMD ./manage.py wait_for_db && ./manage.py migrate && ./manage.py createcachetable && gunicorn -k uvicorn.workers.UvicornWorker -b 0.0.0.0:3000 backend.wsgi
