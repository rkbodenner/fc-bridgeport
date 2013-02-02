#!/bin/sh
#
# Run in development mode

python manage.py collectstatic --noinput
export NEW_RELIC_CONFIG_FILE=newrelic.ini
export NEW_RELIC_ENVIRONMENT=development
if [ ! -d log ]; then mkdir log; fi
touch log/newrelic-python-agent.log
newrelic-admin run-program gunicorn_django -k gevent -w 3
