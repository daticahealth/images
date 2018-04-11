FROM ubuntu:16.04

MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C
RUN apt-get update
RUN apt-get install -y wget
RUN wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/salt.list
RUN apt-get update
RUN apt-get install -y salt-minion python-pip python-dev python-m2crypto git
RUN pip install boto boto3
RUN git clone --recursive https://github.com/kubernetes-client/python.git && cd python && python setup.py install

CMD ["/usr/bin/salt-minion", "-l", "info"]