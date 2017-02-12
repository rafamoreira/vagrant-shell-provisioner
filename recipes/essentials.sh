#!/usr/bin/env bash

if [ ! -f /home/vagrant/provision/essentials ]; then

  sudo apt-get update

  sudo apt-get install -y \
    git-core	\
    curl		\
    wget		\
    build-essential \
    software-properties-common

  su -c "touch /home/vagrant/provision/essentials" vagrant

fi
