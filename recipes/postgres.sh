#!/usr/bin/env bash

# install using postgres ppa 

if [ ! -f /home/vagrant/provision/postgres ]; then

  echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' | sudo tee /etc/apt/sources.list.d/pgdg.list

  wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -

  sudo apt-get update
  sudo apt-get install -y \
    postgresql \
    libpq-dev

  sudo -u postgres psql -c "create user rmc with password 'secret';"
  sudo -u postgres psql -c "alter user rmc with superuser;"

  su -c "touch /home/vagrant/provision/postgres" vagrant

fi
