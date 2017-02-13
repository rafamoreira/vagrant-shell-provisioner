#!/usr/bin/env bash
if [ ! -f /home/vagrant/provision/oh-my-zsh ]; then

  sudo apt-get update
  sudo apt-get install -y zsh

  su -c "cd /home/vagrant && sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"" vagrant

fi