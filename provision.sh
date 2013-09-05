#!/usr/bin/env bash

<%= import 'distro/ubuntu.sh' %>

apt-mirror-pick 'br'

sudo apt-get update

su -c "mkdir /home/vagrant/provision" vagrant

<%= import 'recipes/update_system.sh' %>
<%= import 'recipes/essentials.sh' %>
<%= import 'recipes/postgres.sh' %>
<%= import 'recipes/nodejs.sh' %>
<%= import 'recipes/imagemagick.sh' %>
<%= import 'recipes/rbenv.sh' %>
