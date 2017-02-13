#!/usr/bin/env bash
if [ ! -f /home/vagrant/provision/zsh ]; then

  sudo apt-get update
  sudo apt-get install -y zsh

  su -c "touch /home/vagrant/provision/zsh" vagrant

fi