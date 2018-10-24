FROM ubuntu:16.04

LABEL maintainer="Datica <admin@datica.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

RUN apt-get update && \
    apt-get install -y \
        jq \
        wget \
        curl \
        git \
        vim \
        cmake \
        lsb-core \
        unzip \
        iptables-persistent \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        gnupg \
        virt-what \
        libffi-dev \
        libssl-dev \
        python-pip \
        python-dev \
        python-openssl \
        python-git \
        python-pygit2 \
        swig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip terraform_0.11.7_linux_amd64.zip && \
    mv terraform /usr/local/sbin/

RUN curl -fsSL https://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/2018.3 xenial main" > /etc/apt/sources.list.d/salt.list

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# install salt before any pip installations - pip will change out the versions
# of some of the dependencies later. salt seems to be ok with this.
RUN apt-get update && \
    apt-get install -y \
        docker-ce=17.12.1~ce-0~ubuntu \
        salt-minion

RUN pip  --disable-pip-version-check install \
        "pyasn1==0.4.1" \
        M2crypto==0.30.1 \
        cffi==1.5.2 \
        kubernetes==7.0.0 \
        boto==2.49.0 \
        boto3==1.8.3 \
        docker==3.5.1 \
        awscli==1.16.3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/opt:${PATH}"

CMD ["/usr/bin/salt-minion", "-l", "info"]
