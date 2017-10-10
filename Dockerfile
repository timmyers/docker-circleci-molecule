FROM ubuntu:17.04

RUN \
  apt-get update && \
  apt-get -y install \
    vagrant \
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
