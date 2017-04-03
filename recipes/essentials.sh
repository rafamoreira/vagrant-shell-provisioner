#!/usr/bin/env bash

if [ ! -f /home/vagrant/provision/essentials ]; then

  sudo apt-get install -y -qq \
    git-core	\
    curl		\
    wget		\
    build-essential \
    software-properties-common \
    tklib \
    zlib1g-dev \
    libssl-dev \
    libreadline-gplv2-dev \
    libxml2 \
    libxml2-dev \
    libxslt1-dev \
    vim 
    
  su -c "touch /home/vagrant/provision/essentials" vagrant

fi
