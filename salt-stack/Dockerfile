FROM ubuntu:16.04
MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

ARG SALT_VER=latest

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN apt-get install -y \
  curl \
  python \
  apt-utils \
  python-software-properties \
  software-properties-common && \
  curl -SsLO https://bootstrap.pypa.io/get-pip.py && \
  python get-pip.py && rm -f get-pip.py

RUN pip install boto boto3 kubernetes cherrypy
RUN curl -L https://bootstrap.saltstack.com | sh -s -- -X git develop

