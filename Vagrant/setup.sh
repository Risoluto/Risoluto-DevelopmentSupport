#!/bin/bash
export LANG=ja_JP.UTF-8

# System Update
yum -y update >& /var/log/vagrant_yum_update.log

# Risoluto Deploy
mkdir -p /root/gittmp
cd /root/gittmp
git clone https://github.com/Risoluto/Risoluto-Core.git
rm -fr /var/www/public_html
mv /root/gittmp/Risoluto-Core/* /var/www/.
chown -R apache.apache /var/www/*
cd /var/www/risoluto/lib/
curl -sS https://getcomposer.org/installer | /usr/local/php7/bin/php
/usr/local/php7/bin/php composer.phar install -o --dev
chmod -R 777 /var/www/risoluto/data
rm -fr /root/gittmp
