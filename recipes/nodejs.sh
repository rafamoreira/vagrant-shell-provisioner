#!/usr/bin/env bash


if [ ! -f /home/vagrant/provision/nodejs ]; then

  sudo add-apt-repository -y ppa:chris-lea/node.js
  sudo apt-get update
  sudo apt-get install -y nodejs

  touch /home/vagrant/provision/nodejs

fi
