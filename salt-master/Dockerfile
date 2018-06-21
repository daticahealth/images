FROM ubuntu:16.04

MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt-get update && \
    apt-get install -y \
    jq \
    cron \
    wget \
    curl \
    vim \
    python-pip && \
    pip install awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3 xenial main" > /etc/apt/sources.list.d/salt.list
RUN apt-get update
RUN apt-get install -y salt-master

ADD . /srv/salt

COPY scripts/checks/cronschedule /var/spool/cron/crontabs/root
RUN service cron start

CMD ["/usr/bin/salt-master", "--log-level", "info"]
