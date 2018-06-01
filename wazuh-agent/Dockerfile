FROM ubuntu:16.04

MAINTAINER Datica <admin@datica.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget


RUN apt-get install -y apt-transport-https && \
  apt-get install -y lsb-release

RUN wget -O - https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -

RUN echo "deb https://packages.wazuh.com/3.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list

RUN apt-get update && \
  apt-get install wazuh-agent
