FROM ubuntu:18.04

MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    gnupg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    echo "deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main" > /etc/apt/sources.list.d/salt.list && \
    apt-get update && \
    apt-get install -y \
    jq \
    cmake \
    salt-master \
    salt-syndic \
    python-git \
    python-openssl \
    python-dev \
    python-pip \
    python-pygit2 \
    libffi-dev \
    virt-what \
    build-essential && \
    pip install cffi && \
    pip install awscli && \
    pip install boto boto3 kubernetes cherrypy \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN service stop salt-master
RUN service stop salt-minion
