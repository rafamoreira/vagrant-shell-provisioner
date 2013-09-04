#!/usr/bin/env bash

<%= import 'distro/ubuntu.sh' %>

apt-mirror-pick 'br'

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

mkdir /home/vagrant/provision

<%= import 'recipes/essentials.sh' %>
<%= import 'recipes/ruby.sh' %>
<%= import 'recipes/postgres.sh' %>
<%= import 'recipes/nodejs.sh' %>
<%= import 'recipes/imagemagick.sh' %>
