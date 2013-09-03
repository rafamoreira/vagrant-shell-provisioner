#!/usr/bin/env bash

if [ ! -f /home/vagrant/provision/essentials ]; then

  sudo apt-get update

  sudo apt-get install -y \
    git-core	\
    curl		\
    wget		\
    build-essential \
    python-software-properties

  touch /home/vagrant/essentials

fi
