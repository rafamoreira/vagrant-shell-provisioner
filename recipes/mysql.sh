#!/usr/bin/env bash
if [ ! -f /home/vagrant/provision/mysql ]; then

  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root' 
  sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
  sudo apt-get install -y -qq mysql-server

  su -c "touch /home/vagrant/provision/mysql" vagrant

fi
