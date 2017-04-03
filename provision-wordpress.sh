#!/usr/bin/env bash

<%= import 'distro/ubuntu.sh' %>


su -c "mkdir -p /home/vagrant/provision" vagrant

if [ ! -f /home/vagrant/provision/mirrorpick ]; then
  apt-mirror-pick 'br'
  su -c "touch /home/vagrant/provision/mirrorpick" vagrant
fi

<%= import 'recipes/update_system.sh' %>
<%= import 'recipes/essentials.sh' %>
<%= import 'recipes/apache.sh' %>
<%= import 'recipes/mysql.sh' %>
<%= import 'recipes/php70.sh' %>
<%= import 'recipes/links.sh' %>
