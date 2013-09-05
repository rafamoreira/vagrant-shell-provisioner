#!/usr/bin/env bash

if [ ! -f /home/vagrant/provision/imagemagick ]; then

  sudo apt-get update
  sudo apt-get install -y \
    imagemagick \
    libmagickcore-dev \
    libmagickwand-dev

  su -c "touch /home/vagrant/provision/imagemagick" vagrant
fi
