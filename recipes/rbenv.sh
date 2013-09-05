#!/usr/bin/env bash

#install ruby with rbenv

if [ ! -f /home/vagrant/provision/rbenv ]; then

  su -c "curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash" vagrant

  echo '
export RBENV_ROOT="${HOME}/.rbenv"

if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi' >> /home/vagrant/.bashrc

  su -c "/home/vagrant/.rbenv/bin/rbenv bootstrap-ubuntu-12-04" vagrant

  su -c "/home/vagrant/.rbenv/bin/rbenv install 2.0.0-p247" vagrant

  su -c "/home/vagrant/.rbenv/bin/rbenv global 2.0.0-p247" vagrant

  su -c "touch /home/vagrant/provision/rbenv" vagrant
fi
