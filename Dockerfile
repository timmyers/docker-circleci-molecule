FROM ubuntu:17.04

ADD \
  https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb \
  /tmp/vagrant.deb

RUN \
  dpkg -i /tmp/vagrant.deb

RUN \
  apt-get update && \
  apt-get -y install \
    python \
    python-pip \
    software-properties-common && \
  apt-add-repository ppa:ansible/ansible && \
  apt-get update && \
  apt-get -y install ansible && \
  rm -rf /var/lib/apt/lists/*

RUN \
  pip install \
  molecule \
  python-vagrant

RUN vagrant box add ubuntu/xenial64
