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
        libgit2-dev=0.24.1-2ubuntu0.2 \
        git \
        swig && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip && unzip terraform_0.11.7_linux_amd64.zip && \
    mv terraform /usr/local/sbin/

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && \
    apt-get install -y \
        docker-ce=18.06.1~ce~3-0~ubuntu

RUN mkdir -p /opt/salt-build && \
    git clone https://github.com/saltstack/salt.git -b 2018.3 --depth 1 /opt/salt-build && \
    cd /opt/salt-build && \
    python setup.py install && \
    rm -rf ./*

RUN pip install \
        tornado \
        jinja2 \
        msgpack \
        pyzmq \
        pyasn1 \
        M2crypto \
        cffi \
        "pygit2<0.25" \
        kubernetes \
        boto3 \
        docker \
        awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="/opt:${PATH}"

CMD ["/usr/local/bin/salt-minion", "-l", "info"]
