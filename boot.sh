#!/bin/sh
pipenv shell
flask deploy
exec gunicorn -b 0.0.0.0:5000 --access-logfile - --error-logfile - myflasky:app