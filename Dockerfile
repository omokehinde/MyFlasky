FROM python:3.7-alpine

ENV FLASK_APP myflasky.py
ENV FLASK_CONFIG docker

RUN adduser -D myflasky
USER myflasky

WORKDIR /home/myflasky

COPY requirements requirements
RUN python -m venv venv
RUN venv/bin/pip install -r requirements/docker.txt

COPY app app
COPY migrations migrations
COPY myflasky.py config.py boot.sh ./

# run-time configuration
EXPOSE 5000
ENTRYPOINT ["./boot.sh"]