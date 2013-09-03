#!/usr/bin/env bash

<%= import 'distro/ubuntu.sh' %>

apt-mirror-pick 'br'

sudo apt-get update
sudo apt-get upgrade -y

mkdir /home/vagrant/provision

<%= import 'recipes/essentials.sh' %>
<%= import 'recipes/ruby.sh' %>
<%= import 'recipes/postgres.sh' %>
<%= import 'recipes/nodejs.sh' %>
<%= import 'recipes/imagemagick.sh' %>
