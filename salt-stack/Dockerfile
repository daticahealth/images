from debian:jessie
MAINTAINER Datica <admin@datica.com>
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C
RUN apt-get update && apt-get upgrade -y -o DPkg::Options::=--force-confold && \
    apt-get install -y -o DPkg::Options::=--force-confold wget && \
    wget -O - https://repo.saltstack.com/apt/debian/8/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - && \
    echo "deb http://repo.saltstack.com/apt/debian/8/amd64/latest jessie main" > /etc/apt/sources.list.d/salt.list && \
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
