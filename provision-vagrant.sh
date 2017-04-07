#!/usr/bin/env bash

# INSTALL MYSQL (and create a database)

sudo apt-get update -q
debconf-set-selections <<< 'mysql-server mysql-server/root_password password mypassword'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mypassword'
sudo apt-get install -y mysql-server
echo 'create database swndb;' | mysql --user=root --password=mypassword
