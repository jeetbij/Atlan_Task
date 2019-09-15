celery -A Collect worker -l info &
gunicorn --blind 0.0.0.0:8000 Collect.wsgi:application