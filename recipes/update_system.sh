#!/usr/bin/env bash

sudo apt-get update -qq

DEBIAN_FRONTEND=noninteractive apt-get -y -qq -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" dist-upgrade
