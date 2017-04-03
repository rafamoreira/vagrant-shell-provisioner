#!/usr/bin/env bash


dir=/vagrant
www=/var/www

# refer to this location for where it will pick the target links 1 link per line
link_refs=/vagrant/link.txt

#(original location, destiny location)
create_symlinks (){
  if [ ! -e $2 ]; then
    ln -s $1 $2
    echo "created ln -s $1 $2"
  else
    echo "already exists ln -s $1 $2"
  fi
}

#(original location, destiny location)
create_apache_symlinks (){
  if [ ! -L $2 ]; then
    ln -s $1 $2
    echo "created ln -s $1 $2"
  else
    echo "already exists ln -s $1 $2"
  fi
}

while IFS='' read -r line || [[ -n "$line" ]]; do
  create_symlinks $dir/$line $www/$line
  create_apache_symlinks $dir/$line.conf /etc/apache2/sites-enabled/$line.conf
done < "$link_refs"

service apache2 restart
