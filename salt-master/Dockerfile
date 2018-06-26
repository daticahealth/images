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
    cmake \
    python-dev \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libssh2-1 \
    libgit2-dev \
    python-pip && \
    pip install awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/libgit2/libgit2/archive/v0.27.0.tar.gz -O /root/v0.27.0.tar.gz && \
    cd /root && \
    tar xzf /root/v0.27.0.tar.gz && \
    cd /root/libgit2-0.27.0 && \
    cmake . && \
    make && \
    make install && \
    pip install pygit2 && \
    rm -rf /root/libgit2-0.27.0/ && \
    rm /root/v0.27.0.tar.gz

RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3 xenial main" > /etc/apt/sources.list.d/salt.list
RUN apt-get update
RUN apt-get install -y salt-master salt-syndic

CMD ["/usr/bin/salt-master", "--log-level", "info"]
