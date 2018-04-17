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
RUN apt-get install -y unzip
RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip terraform_0.11.7_linux_amd64.zip && mv terraform /usr/local/sbin/

CMD ["/usr/bin/salt-master", "--log-level", "warning"]