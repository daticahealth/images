FROM ubuntu:16.04
MAINTAINER Datica <admin@datica.com>
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold && \
    apt-get install -y -o DPkg::Options::=--force-confold wget && \
    wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d && \
    apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold

RUN apt-get install -y -o DPkg::Options::=--force-confold \
  python \
  apt-utils \
  python-software-properties \
  software-properties-common \
  python-yaml \
  python-m2crypto \
  python-crypto \
  msgpack-python \
  python-zmq \
  python-jinja2 \
  python-requests \
  python-pip \
  curl

RUN pip install boto boto3
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -X git develop
