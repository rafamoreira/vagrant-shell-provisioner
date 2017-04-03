#!/usr/bin/env bash
if [ ! -f /home/vagrant/provision/apache ]; then

  sudo apt-get install -y -qq apache2

  su -c "touch /home/vagrant/provision/apache" vagrant

fi
