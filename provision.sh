#!/usr/bin/env bash

<%= import 'distro/ubuntu.sh' %>

apt-mirror-pick 'br'

su -c "mkdir -p /home/vagrant/provision" vagrant

<%= import 'recipes/update_system.sh' %>
<%= import 'recipes/essentials.sh' %>
<%= import 'recipes/rbenv.sh' %>
