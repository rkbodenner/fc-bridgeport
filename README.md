# Setup
Instructions follow for a stock OS X Mountain Lion installation.

## libevent
To run gunicorn with gevent, you'll need libevent. Otherwise, you'll see this later:

    gevent/libevent.h:9:19: error: event.h: No such file or directory

First, install the Xcode Command Line Tools.

Install with Homebrew (brew install libevent) or MacPorts (sudo port install libevent).

## Python
OS X comes with Python.

### virtualenv + pip
You'll need virtualenv (to manage independent sets of Python packages), which in turn comes with pip (to install/manage the packages themselves).

0. In the directory where you're storing Python environments...

    cd python-envs

0. Install virtualenv

    curl -O https://raw.github.com/pypa/virtualenv/master/virtualenv.py

0. Create a new environment

    python virtualenv.py fc-bridgeport

0. Activate it. _You'll have to do this every time you start a new shell._

    source fc-bridgeport/bin/activate

### Packages
0. Download and install Python package dependencies:

    pip install -r requirements.txt

## Database
The site uses sqlite3 in development mode.

0. Copy the file containing DB settings to the right place

    cp local_settings.py.example local_settings.py

0. Initialize the database. You will see some prompts.

    python manage.py syncdb

    0. Set up a superuser
    0. Use the default site record
    0. (Optionally) install initial content. You could also sync database content from production, or create your own.

### New Relic
Set the NEW_RELIC_LICENSE_KEY environment variable.

### SendGrid
Set the SENDGRID_USERNAME and SENDGRID_PASSWORD environment variables.

Otherwise, mail gets delivered with the local MTA. That probably won't work on stock OS X.

# Run
## Locally

    ./run-development.sh

## Heroku
### Add-ons
* Postgres
* SendGrid
