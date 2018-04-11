FROM debian:jessie

MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C
RUN apt-get update
RUN apt-get install -y wget
RUN wget -O - https://repo.saltstack.com/apt/debian/8/amd64/2017.7/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/debian/8/amd64/2017.7 jessie main" > /etc/apt/sources.list.d/salt.list
RUN apt-get update
RUN apt-get install -y salt-master

CMD ["/usr/bin/salt-minion", "-l", "info"]