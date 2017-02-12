#!/usr/bin/env bash

#install ruby with rbenv

if [ ! -f /home/vagrant/provision/rbenv ]; then

  su -c "git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv" vagrant
  su -c "git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build" vagrant
  su -c "git clone https://github.com/rkh/rbenv-whatis.git /home/vagrant/.rbenv/plugins/rbenv-whatis" vagrant
  su -c "git clone https://github.com/rkh/rbenv-use.git /home/vagrant/.rbenv/plugins/rbenv-use" vagrant

  echo '
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
' >> /home/vagrant/.bash_profile

  su -c "touch /home/vagrant/provision/rbenv" vagrant
fi
