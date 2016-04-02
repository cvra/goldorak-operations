FROM ubuntu:14.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common \
        ca-certificates \
        curl \
        git \
        python-pip \
    && add-apt-repository -y ppa:saltstack/salt \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        salt-minion \
        salt-common \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -Ums /bin/bash ubuntu
RUN echo "ubuntu    ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN git clone https://github.com/cvra/goldorak-operations.git

USER ubuntu
RUN sudo salt-call --local --file-root=goldorak-operations/salt/roots state.highstate
