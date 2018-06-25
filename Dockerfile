FROM ubuntu:16.04

MAINTAINER tinhnh<tinhhuu96@gmail.com>

RUN apt-get update
RUN apt-get install nginx -y
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get install -y mysql-server

WORKDIR /venv

ADD start.sh /venv

RUN chmod a+x /venv/*

ENTRYPOINT ["/venv/start.sh"]

EXPOSE 80
