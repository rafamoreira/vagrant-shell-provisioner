#!/usr/bin/env bash

# install ruby using the compiled packages from @fnando

if [ ! -f /home/vagrant/provision/ruby ]; then

  
  wget -O - http://apt.hellobits.com/hellobits.key | sudo apt-key add -

  echo 'deb http://apt.hellobits.com/ precise main' | sudo tee /etc/apt/sources.list.d/hellobits.list

  sudo apt-get update
  sudo apt-get install -y ruby-ni

  echo '
  gemhome: "/home/vagrant/.gems"
  update: --no-document
  install: --no-document' > /home/vagrant/.gemrc

  echo '
    export GEM_HOME="$HOME/.gems"
    export GEM_PATH="$GEM_HOME"
    export PATH="$GEM_PATH/bin:$PATH"
    export SPRING_TMP_PATH="/home/vagrant/spring_tmp" # Temp PATH for spring' >> /home/vagrant/.bashrc

  su -c "touch /home/vagrant/provision/ruby" vagrant

fi
