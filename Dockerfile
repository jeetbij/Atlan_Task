FROM python:3.6.8

ENV PYTHONUNBUFFERED 1
RUN mkdir /Collect
WORKDIR /collect
COPY ./ ./
RUN pip install -r requirements.txt
ENV DEBUG=0
ENV ALLOWED_HOSTS=*
ENV SECRET_KEY=1v3&61&#p(g-x!c%zix&-5t-%efp&xc$m+qu*+7pzcwatzxfq0
RUN python manage.py makemigrations --noinput
RUN python manage.py migrate --noinput
RUN celery -A Collect worker -l info & python manage.py runserver 0.0.0.0:5000