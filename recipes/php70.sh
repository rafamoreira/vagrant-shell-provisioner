#!/usr/bin/env bash
if [ ! -f /home/vagrant/provision/php70 ]; then

  sudo apt-get install -y -qq php7.0 libapache2-mod-php7.0  

  su -c "touch /home/vagrant/provision/php70" vagrant

  sudo service apache2 restart

  echo "<?php phpinfo(); ?>" >> /var/www/index.php

fi
