FROM jenkins/jenkins:lts-jdk11

LABEL maintainer "r1co@post-box.cc"

USER root

# install deps
RUN apt-get update && apt-get install -y \
    bsdmainutils \
    python3 \
    python3-pip \
    python3-setuptools \
    wget \
    && rm -rf /var/lib/apt/lists/*

# add nodejs repo
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

# install deps
RUN apt-get update && apt-get install -y \
    nodejs \
    && rm -rf /var/lib/apt/lists/*


# RUN easy_install pip

RUN pip3 install xq


# install docker cli
RUN mkdir -p /tmp/_install && cd /tmp/_install && wget https://download.docker.com/linux/static/stable/x86_64/docker-18.09.0.tgz  && tar -xvzf docker-18.09.0.tgz  && cd docker && cp docker /usr/bin/docker && rm -rf  /tmp/_install
RUN chmod +x /usr/bin/docker

# add jenkins to docker group
RUN groupadd -g 999 docker
RUN usermod -a -G docker jenkins

# install docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# install snyk
RUN npm install -g snyk

# show env
RUN env

USER jenkins
