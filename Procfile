web: python manage.py collectstatic --noinput; NEW_RELIC_CONFIG_FILE=newrelic.ini newrelic-admin run-program gunicorn_django -b 0.0.0.0:$PORT -k gevent -w 1
