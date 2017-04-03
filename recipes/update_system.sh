#!/usr/bin/env bash

run_update(){
  echo "updating system"
  sudo apt-get update -qq 

  DEBIAN_FRONTEND=noninteractive apt-get -y -qq -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold" dist-upgrade
  su -c "touch /home/vagrant/provision/updated" vagrant
}


# shell scripts are not my forte so I will not combine the two ifs for clarity
# here is the check if the system was never updated
if [ ! -f /home/vagrant/provision/updated ]
then
  run_update
fi

# here we check if the system was updated in the last hour
if [ `stat --format=%Y /home/vagrant/provision/updated` -le $(( `date +%s` - 3600 )) ]
then
  run_update
fi

