FROM ubuntu:16.04

MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C
RUN apt-get update
RUN apt-get install -y wget
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3 xenial main" > /etc/apt/sources.list.d/salt.list
RUN apt-get update
RUN apt-get install -y salt-master

RUN ln -sf /dev/stdout /var/log/salt/master

CMD ["/usr/bin/salt-master", "-d", "-l", "info"]