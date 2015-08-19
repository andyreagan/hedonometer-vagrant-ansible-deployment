#!/usr/bin/env bash

# INSTALL EVERYTHING

apt-get update -q
debconf-set-selections <<< 'mysql-server mysql-server/root_password password mypassword'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mypassword'
apt-get install -y mysql-server
mysql --user=root --password=mypassword < /vagrant/create_database.sql

# start uwsgi:
# uwsgi --ini dev_uwsgi.ini >> uwsgi.log 2>&1 &
